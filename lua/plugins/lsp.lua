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
    opts = {
      ui = {
        border = "single"
      }
    },
  },
  {
    "j-hui/fidget.nvim",
    opts = {
      notification = {
        window = {
          winblend = 0,
        }
      }
    },
    lazy = true,
    event = "LspAttach",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    opts = {
      ensure_installed = { "lua_ls" },
    },
    dependencies = {
      "williamboman/mason.nvim",
    }
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "mrcjkb/rustaceanvim",
    },
  },
  {
    "folke/lazydev.nvim",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
        { path = "wezterm-types",      mods = { "wezterm" } },
      }
    },
    ft = "lua",
    event = "LspAttach",
  },
  { "Bilal2453/luvit-meta",        lazy = true },
  { "justinsgithub/wezterm-types", lazy = true, ft = "lua" },
  {
    'mrcjkb/rustaceanvim',
    lazy = false,
  },
  {
    "zbirenbaum/copilot.lua",
    enabled = true,
    opts = {
      suggestion = { enabled = true },
      panel = { enabled = true },
    }
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
    enabled = true,
    dependencies = {
      "neovim/nvim-lspconfig",
    }
  },
}
