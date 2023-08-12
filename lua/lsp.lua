local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

--Default settings like keymaps
local function attach_default(bufnr)
  require("keymaps").lsp(bufnr)
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

  ["lua_ls"] = function()
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = function(_, bufnr)
        attach_default(bufnr)
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
