local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd

local ok, e = pcall(require, "plugins")
if not ok then
  print("Error while loading Plugin! " .. e)
end

opt.foldlevelstart = 99
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

opt.swapfile = false
opt.syntax = "on"
opt.mouse = "a"
opt.encoding = "UTF-8"
opt.number = true
opt.relativenumber = true
opt.title = true
opt.cursorline = true
opt.smartindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.ignorecase = true
opt.termguicolors = true
opt.updatetime = 100

opt.laststatus = 0

opt.timeout = true
opt.timeoutlen = 300

require("lsp").set_capabilities()

require("onedark").load()

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
autocmd("TermOpen", {
  command = 'setlocal nonumber norelativenumber laststatus=0 nocursorline',
})


vim.cmd([[
  set guifont=Iosevka\ Nerd\ Font:h16
]])
