vim.loader.enable()

--
local ok, e = pcall(require, "core")
if not ok then
  print("Error while loading Plugins! \n Error: " .. e)
end

require("onedark").load()

--require("lsp").set_capabilities()
