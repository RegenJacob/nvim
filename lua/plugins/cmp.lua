local source_mapping = {
  buffer = "[BUF]",
  nvim_lsp = "[LSP]",
  cmdline = "[CMD]",
  nvim_lsp_signature_help = "[SIG]",
  path = "[PATH]",
  crates = "[CRATE]",
  treesitter = "[TS]",
  copilot = "[COP]",
  snippy = "SP"
}

return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { link = "String" })

      ---@diagnostic disable: missing-fields
      cmp.setup({
        formatting = {
          symbol_map = { copilot = "" },
          format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '…',
            before = function(entry, vim_item)
              vim_item.kind = lspkind.presets.default[vim_item.kind]

              local menu = source_mapping[entry.source.name]
              print(entry.source.name, menu)

              vim_item.menu = menu

              return vim_item
            end
          })
        },

        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = {
            border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' }
          },
          documentation = {
            border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' }
          }
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
          { name = "path" },
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
          { name = "crates" },
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
      ---@diagnostic enable: missing-fields
    end,
    dependencies = {
      "saecki/crates.nvim",
      "onsails/lspkind.nvim",
      "zbirenbaum/copilot-cmp",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
  },
  {
    "onsails/lspkind.nvim",
    lazy = true,
    dependencies = {
      "zbirenbaum/copilot-cmp",
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
    dependencies = {
      "onsails/lspkind.nvim",
      "zbirenbaum/copilot.lua",
    }
  },
  {
    "saecki/crates.nvim",
    lazy = true,
    config = true,
    event = "BufEnter Cargo.toml",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
