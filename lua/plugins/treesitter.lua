return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "rust" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
    },
  },
  {
    'm-demare/hlargs.nvim',
  },
  {
    'MeanderingProgrammer/markdown.nvim',
    main = "render-markdown",
    opts = {},
    name = 'render-markdown',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = true,
    config = function()
      require("treesitter-context").setup({
        max_lines = 2,
        trim_scope = "inner",
      })
    end,
  },
}
