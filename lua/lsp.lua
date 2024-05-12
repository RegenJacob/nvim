local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

--Default settings like keymaps
local function attach_default(client, bufnr)
  require("keymaps").lsp(bufnr)
  vim.lsp.inlay_hint.enable(true)
end

require("mason-lspconfig").setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        attach_default(client, bufnr)
      end,
    })
  end,
  ['rust_analyzer'] = function() end,
  ["typst_lsp"] = function()
    lspconfig.typst_lsp.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        attach_default(client, bufnr)
      end,
      settings = {
        exportPdf = "onType",
        filetypes = { "typst", "typ" }
      }
    })
  end,
  ["lua_ls"] = function()
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        attach_default(client, bufnr)
      end,
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace"
          }
        }
      }
    })
  end
})

vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      attach_default(client, bufnr)
    end
  }
}
