return {
  'nvim-telescope/telescope.nvim', tag = '0.1.2',
  cmd = "Telescope",
  config = function ()
    require("telescope").setup({
      defaults = {
        border = true,
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
      }
    })
  end,
  dependencies = {
    'nvim-lua/plenary.nvim'
  }
}
