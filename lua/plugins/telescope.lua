return {
  'nvim-telescope/telescope.nvim', tag = '0.1.2',
  keys = {
    {"<Leader>ss", desc = "Telescope file search"},
    {"<Leader>sr", desc = "Telescope recent Files"},
    {"<Leader>gl", desc = "Telescope git commits"},
    {"?", desc = "Telescope current buffer fuzzy find"},
  },
  config = function ()
    require("telescope").setup({
      defaults = {
        border = true,
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
      }
    })
    require("keymaps").telescope()
  end,
  cmd = "Telescope",
  dependencies = {
    'nvim-lua/plenary.nvim'
  }
}
