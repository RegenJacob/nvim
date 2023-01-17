function onedark()
  print("hi")
  require('onedark').setup {
    transparent = not vim.g.neovide == true, -- dissable transparency on neovide 
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
end
