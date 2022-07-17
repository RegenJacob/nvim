local opt = vim.opt
local g = vim.g

local ok, _ = pcall(require, 'plugins')
if not ok then
  print("Error while loading Plugins!")
end

ok, _ = pcall(require, 'lspconf')
if not ok then
  print("Error while loading lsp!")
end



opt.swapfile = false
opt.syntax = 'on'
opt.mouse = 'a'
opt.encoding = 'UTF-8'
opt.number = true

opt.expandtab = true
opt.shiftwidth = 2

g.livepreview_previewer = 'zathura'

-- opt.cursorline = true
require('onedark').setup {
    transparent = false,
    style = 'dark'
}
require('onedark').load()

--[[
hello
]]--

vim.cmd([[

autocmd TermOpen term://* setlocal nonumber  laststatus=0
noremap <C-n> :NvimTreeToggle<CR>

]])
