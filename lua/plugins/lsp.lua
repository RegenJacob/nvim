-- LSP Related things

return {
  {
    'nvimdev/lspsaga.nvim',
    event = "LspAttach",
    config = function()
      require('lspsaga').setup({})
      require("keymaps").lspsaga()
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
    }
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
        ui = {
          border = "single"
        }
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    branch = "legacy",
    config = function()
      require("fidget").setup({
        text = { spinner = "dots_snake" },
        window = { blend = 0 },
      })
    end,
    lazy = true,
    event = "LspAttach",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
      })
    end,
    dependencies = {
      "williamboman/mason.nvim",
    }
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      "williamboman/mason.nvim",
    },
  },
  {
    "folke/neodev.nvim",
    opts = {},
    ft = "lua",
    event = "LspAttach",
  },
  {
    'mrcjkb/rustaceanvim',
    version = "^4",
    lazy = false,
  },
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = true },
        panel = { enabled = false },
      })
    end,
  },
  {
    'kaarmu/typst.vim',
    ft = 'typst',
    command = ':TypstWatch',
    lazy = false,
  },
  {
    "xuhdev/vim-latex-live-preview",
    ft = "tex",
  },
  { -- Completion for nvim api
    "ii14/emmylua-nvim",
    ft = "lua",
    enabled = false,
    dependencies = {
      "neovim/nvim-lspconfig",
    }
  },
}
