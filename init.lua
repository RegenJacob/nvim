local opt = vim.opt

local ok, e = pcall(require, 'plugins')
if not ok then
  print('Error while loading Plugin! ' .. e)
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
opt.expandtab = false
opt.shiftwidth = 2
opt.ignorecase = true
opt.termguicolors = true
opt.updatetime = 100

require("lsp").set_capabilities() -- let's lsp load earlier

require("onedark").load()

vim.cmd([[

autocmd TermOpen term://* setlocal nonumber norelativenumber laststatus=0 nocursorline
"tnoremap <Esc> <C-\><C-n>
"noremap <C-n> :NeoTreeFocusToggle<CR>

set guifont=Iosevka\ Nerd\ Font:h16

]])
