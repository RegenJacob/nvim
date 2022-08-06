return require('packer').startup(function()
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
    config = function() require'nvim-tree'.setup {} end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
  "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use 'tpope/vim-fugitive'

  use 'neovim/nvim-lspconfig'

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  }
  use 'simrat39/rust-tools.nvim'

  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'xuhdev/vim-latex-live-preview'

end)

