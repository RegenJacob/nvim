local g = vim.g
vim.filetype.add({extension = {wgsl = "wgsl"}})

-- Options for Neovide gui client
g.neovide_transparency=0.9
g.neovide_cursor_vfx_mode = 'wireframe'
g.neovide_floating_blur_amount_x = 5.0
g.neovide_floating_blur_amount_y = 2.0

-- setup in lua/style.lua
require('onedark').load()

require('onedark').setup {
    transparent = not g.neovide == true, -- dissable transparency on neovide 
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
      darker = false,
      undercurl = true,
      background = true
    }
}

require('lualine').setup {
  options = {
    theme = 'onedark',
    section_separators = { left = ' ', right = ' ' },
  }
}

