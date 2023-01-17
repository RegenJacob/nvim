require("mason").setup()
require("mason-lspconfig").setup()
local cmp = require 'cmp'
local lspconfig = require 'lspconfig'
local lspkind = require 'lspkind'
local snippy = require'snippy'

local source_mapping = {
  buffer = "[BUF]",
  nvim_lsp = "[LSP]",
  nvim_lua = "[LUA]",
  cmdline = "[CMD]",
  cmp_tabnine = "[TN]",
  nvim_lsp_signature_help = "[SIG]",
  path = "[PATH]",
  crates = "[CRATE]",
  treesitter = "[TS]",
  snippy = "SP"
}

cmp.setup({
  snippet = {
    expand = function(args)
      snippy.expand_snippet(args.body)
    end
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      presets = 'default',

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        vim_item.kind = lspkind.presets.default[vim_item.kind]

        local menu = source_mapping[entry.source.name]
        if entry.source.name == "cmp_tabnine" then
          if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
            menu = entry.completion_item.data.detail .. " " .. menu
          end
          vim_item.kind = "ﮧ"
        elseif entry.source.name == "buffer" then
          vim_item.kind = "﬘"
        elseif entry.source.name == "crates" then
          vim_item.kind = ""
        elseif entry.source.name == "treesitter" then
          vim_item.kind = "滑"
        elseif entry.source.name == "snippy" then
          vim_item.kind = ""
        end

        vim_item.menu = menu

        return vim_item
      end
    })
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'snippy'},
    { name = 'nvim_lsp_signature_help' },
    { name = 'nvim_lua' },
    { name = 'treesitter' },
    { name = 'cmp_tabnine' },
    { name = "crates" },
    { name = "path" },
    { name = 'buffer' },
  },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require('mason-lspconfig').setup_handlers({
  function (server_name)
    lspconfig[server_name].setup {
      capabilities = capabilities,
    }
  end,

  ["rust_analyzer"] = function ()
    require("rust-tools").setup {
      capabilities = capabilities,
      on_attach = function(_, bufnr)
        local rt = require("rust-tools")
        -- Hover actions
        vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
        -- Code action groups
        vim.keymap.set("<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
      end,
    }
  end
})

