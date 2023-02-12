local M = {}

function M.set_capabilities()
  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

  require("mason-lspconfig").setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
            capabilities = capabilities,
        })
      end,
      ["rust_analyzer"] = function()
        local rt = require("rust-tools")
        rt.setup({
            server = {
                capabilities = capabilities,
                on_attach = function(_, bufnr)
                  -- Hover actions
                  vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                  -- Code action groups
                  vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                end,
            },
        })
      end,
  })
  return capabilities
end

function M.cmp()
  local cmp = require("cmp")

  cmp.setup({
      snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
      },
      window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs( -4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
          { name = "crates" },
      }, {
          { name = "buffer" },
      }),
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({
          { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
      }, {
          { name = "buffer" },
      }),
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
          { name = "buffer" },
      },
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
          { name = "path" },
      }, {
          { name = "cmdline" },
      }),
  })
end

function M.setup_null_ls()
  local null_ls = require("null-ls")

  null_ls.setup({
      sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.completion.spell,
      },
  })
end

return M
