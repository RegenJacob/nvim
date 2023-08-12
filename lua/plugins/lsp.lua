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
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons'      -- optional
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
        ensure_installed = { "lua_ls", "rust_analyzer" },
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
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
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
