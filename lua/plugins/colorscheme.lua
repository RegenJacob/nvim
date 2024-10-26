return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      require("onedark").setup({
        transparent = true, -- disable transparency on neovide
        style = "cool",
        ending_tildes = true,
        cmp_itemkind_reverse = false,
        code_style = {
          comments = "italic",
          keywords = "none",
          functions = "bold",
          strings = "none",
          variables = "none",
        },
        diagnostics = {
          darker = false,
          undercurl = true,
          background = true,
        },
      })

      require("onedark").load()
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    enabled = false,
    priority = 1000, -- Ensure it loads first
    config = function()
      require("onedarkpro").setup({
        options = {
          transparency = true
        }
      })
      vim.cmd("colorscheme onedark")
    end
  },
  {
    "RegenJacob/onedarker",
    priority = 1000,
    enabled = true,
    lazy = false,
    dev = true,
    config = function()
      vim.cmd("colorscheme onedarker")
    end,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      -- Ensure termguicolors is enabled if not already
      vim.opt.termguicolors = true

      require('nvim-highlight-colors').setup({})
    end
  }
  --[[
  {
    "Johan-Palacios/onedarker",
    priority = 1000,
    enabled = false,
    lazy = false,
    config = function()
      vim.cmd("colorscheme onedarker")
    end,
  },
  ]] --
}
