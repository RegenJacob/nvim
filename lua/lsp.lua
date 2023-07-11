local M = {}

function M.set_capabilities()
  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

  local function attach_default(bufnr)
    require("which-key").register({
      ["<Leader>g"] = {
        name = "+goto",
        d = { "lsp", "Goto definition" },
      },
      ["<Leader>F"] = { "lsp", "Format buffer" },
      ["<Leader>a"] = { "<cmd>CodeActionMenu<cr>", "Open CodeActionMenu" },
    })
    vim.keymap.set("n", "<Leader>a", "<cmd>CodeActionMenu<cr>", { buffer = bufnr })
    vim.keymap.set("n", "<C-space>", vim.lsp.buf.hover, { buffer = bufnr })
    vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, { buffer = bufnr })
    vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition, { buffer = bufnr })
  end

  require("mason-lspconfig").setup_handlers({
    function(server_name)
      lspconfig[server_name].setup({
        capabilities = capabilities,
        on_attach = function(_, bufnr)
          attach_default(bufnr)
        end,
      })
    end,
    ["rust_analyzer"] = function()
      local rt = require("rust-tools")
      rt.setup({
        server = {
          capabilities = capabilities,
          on_attach = function(_, bufnr)
            attach_default(bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            --vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            vim.keymap.set("n", "<Leader>r", rt.runnables.runnables, { buffer = bufnr })
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
    mapping = cmp.mapping.preset.insert({
      ["<Tab>"] = cmp.mapping(function(fallback)
        -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
        if cmp.visible() then
          local entry = cmp.get_selected_entry()
          if not entry then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            cmp.confirm()
          end
        else
          fallback()
        end
      end, { "i", "s", "c" }),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    exprimental = {
      ghost_text = false,
      native_menu = false,
    },
    sources = cmp.config.sources({
      { name = "copilot",                group_index = 2 },
      { name = "nvim_lsp" },
      { name = "luasnip" }, -- For luasnip users.
      { name = "nvim_lua" },
      { name = "nvim_lsp_signature_help" },
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

  vim.api.nvim_create_autocmd("BufRead", {
    group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
    pattern = "Cargo.toml",
    callback = function()
      cmp.setup.buffer({ sources = { { name = "crates" } } })
    end,
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
