local opt = vim.opt
local g = vim.g

local ok, e

ok, e = pcall(require, 'plugins')
if not ok then
  print('Error while loading Plugin! ' .. e)
end

ok, e = pcall(require, 'lsp')
if not ok then
  print('Error while loading lsp! ' .. e)
end

opt.foldlevelstart = 99
opt.foldmethod= 'expr'
opt.foldexpr= 'nvim_treesitter#foldexpr()'

opt.swapfile = false
opt.syntax = 'on'
opt.mouse = 'a'
opt.encoding = 'UTF-8'
opt.number = true

opt.expandtab = true
opt.shiftwidth = 2
opt.ignorecase = true

g.livepreview_previewer = 'zathura'


-- Options for Neovide gui client
g.neovide_transparency=0.9
g.neovide_cursor_vfx_mode = 'wireframe'
g.neovide_floating_blur_amount_x = 5.0
g.neovide_floating_blur_amount_y = 2.0

opt.cursorline = true

require('onedark').setup {
    transparent = false,
    style = 'dark',
    ending_tildes = true,
    cmp_itemkind_reverse = false,

    code_style = {
      comments = 'italic',
      keywords = 'none',
      functions = 'bold',
      strings = 'none',
      variables = 'none'
    },

    diagnostics = {
      darker = true,
      undercurl = true,
      background = true
    }
}
require('onedark').load()

vim.cmd([[

autocmd TermOpen term://* setlocal nonumber laststatus=0 nocursorline
tnoremap <Esc> <C-\><C-n>
noremap <C-n> :NvimTreeToggle<CR>
set guifont=Iosevka\ Nerd\ Font:h16

]])

