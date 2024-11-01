return {
  {
    "nacro90/numb.nvim",
    lazy = false,
    config = true,
  },
  {
    'smoka7/hop.nvim',
    config = function()
      -- place this in one of your configuration file(s)
      require("hop").setup {
        keys = 'etovxqpdygfblzhckisuranöä'
      }
      require("keymaps").hop()
    end
  }
}
