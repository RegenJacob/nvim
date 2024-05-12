return  {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function ()
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
