local opt = vim.opt
local g = vim.g

local ok, _ = pcall(require, 'plugins')
if not ok then
  print('Error while loading Plugins!')
end

ok, _ = pcall(require, 'lspconf')
if not ok then
  print('Error while loading lsp!')
end



opt.swapfile = false
opt.syntax = 'on'
opt.mouse = 'a'
opt.encoding = 'UTF-8'
opt.number = true

opt.expandtab = true
opt.shiftwidth = 2
opt.ignorecase = true

g.livepreview_previewer = 'zathura'

g.neovide_transparency=0.9
g.neovide_cursor_vfx_mode = 'wireframe'

-- opt.cursorline = true
require('onedark').setup {
    transparent = false,
    style = 'dark',
    ending_tildes = true,
    cmp_itemkind_reverse = false,

    code_style = {
      comments = 'italic',
      keywords = 'none',
      functions = 'bold',
      strings = 'italic',
      variables = 'none'
    },

    diagnostics = {
      darker = true,
      undercurl = true,
      background = true
    }
}
require('onedark').load()

--[[
hello
]]--

vim.cmd([[

autocmd TermOpen term://* setlocal nonumber  laststatus=0
noremap <C-n> :NvimTreeToggle<CR>
set guifont=Iosevka\ Nerd\ Font:h16

]])

