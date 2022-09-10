local opt = vim.opt
local g = vim.g

local ok, e

ok, e = pcall(require, 'plugins')
if not ok then
  print('Error while loading Plugin! ' .. e)
end

require('impatient')
ok, e = pcall(require, 'lsp')
if not ok then
  print('Error while loading lsp! ' .. e)
end

ok, e = pcall(require, 'style')
if not ok then
  print('Error while style style! ' .. e)
end

opt.foldlevelstart = 99
opt.foldmethod= 'expr'
opt.foldexpr= 'nvim_treesitter#foldexpr()'

opt.swapfile = false
opt.syntax = 'on'
opt.mouse = 'a'
opt.encoding = 'UTF-8'
opt.number = true
opt.relativenumber = true
opt.title = true
opt.cursorline = true
opt.smartindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.ignorecase = true
opt.termguicolors = true
opt.updatetime = 1

g.livepreview_previewer = 'zathura'
g.tpipeline_cursormoved = 1


-- setup in lua/style.lua
require('onedark').load()

vim.cmd([[

autocmd TermOpen term://* setlocal nonumber norelativenumber laststatus=0 nocursorline
tnoremap <Esc> <C-\><C-n>
noremap <C-n> :NeoTreeFocusToggle<CR>

set guifont=Iosevka\ Nerd\ Font:h16

]])

