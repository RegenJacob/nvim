local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd

opt.foldlevelstart = 99
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

opt.signcolumn = "yes"
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
opt.timeout = true
opt.timeoutlen = 900
opt.laststatus = 0
opt.list = true
opt.guifont = "Iosevka Nerd Font:h16s"
--opt.spelllang = "de,en" --this seems to slow down neovim????

-- Options for Neovide gui client
vim.g.neovide_transparency = 0.9
vim.g.neovide_cursor_vfx_mode = 'wireframe'
vim.g.neovide_floating_blur_amount_x = 5.0
vim.g.neovide_floating_blur_amount_y = 2.0

-- Treesitter ft detection
vim.filetype.add({ extension = { wgsl = "wgsl" } })
vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
autocmd("TermOpen", {
  command = "setlocal nonumber norelativenumber laststatus=0 nocursorline",
})

vim.cmd([[
  set runtimepath+=/usr/share/vim/vimfiles
]])
