vim.loader.enable()

require("options")

local ok, e = pcall(require, "core")
if not ok then
  print("Error while loading Plugins! \n Error: " .. e)
end

--require("lsp").set_capabilities()
