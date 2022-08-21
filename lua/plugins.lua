return require('packer').startup({function()
  use 'wbthomason/packer.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function ()
      require'nvim-treesitter.configs'.setup {
        highlight = {
          enable = true
        }
      }
    end
  }

  use { -- Lsp stuff very scary 
    'neovim/nvim-lspconfig',
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp'

  }

  use 'mfussenegger/nvim-dap'

  --
  -- Theming
  --

  -- Color Theme
  use 'navarasu/onedark.nvim'

  -- Css color preview
  -- use 'ap/vim-css-color'

  use { 
    'norcalli/nvim-colorizer.lua',
    config = function()
      require'colorizer'.setup()
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
        require('lualine').setup {
          options = {
            theme = 'onedark'
          }
      }
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function()
      require'nvim-tree'.setup({
      })
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }

  use {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    requires = { {'nvim-lua/plenary.nvim'} },
  }

  use {
  "folke/which-key.nvim",
    disabled = true,
    config = function()
      require("which-key").setup {}
    end
  }



  use 'pierreglaser/folding-nvim'

  use 'simrat39/rust-tools.nvim'

  -- LSP source for nvim-cmp
  use  {
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'ray-x/cmp-treesitter',
    'hrsh7th/cmp-nvim-lua',
    'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    'L3MON4D3/LuaSnip' -- Snippets plugin
  }

  use 'xuhdev/vim-latex-live-preview'

  use {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
        require('crates').setup()
    end,
  }

end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})

