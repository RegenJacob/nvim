vim.loader.enable()

require("options")
require("keymaps").general()

-- let neovim run even if plugins fail
local ok, e = pcall(require, "core")
if not ok then
  print("Error while loading Plugins! \n Error: " .. e)
end
