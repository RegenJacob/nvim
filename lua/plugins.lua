-- Automatically install packer 
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({function(use)
  use 'wbthomason/packer.nvim'

  use 'lewis6991/impatient.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function ()
      require'nvim-treesitter.configs'.setup {
        highlight = {
          enable = true
        },
        refactor = {
          highlight_definitions = {
            enable = true,
            -- Set to false if you have an `updatetime` of ~100.
            clear_on_cursor_move = true,
          },
          smart_rename = {
            enable = true,
            keymaps = {
              smart_rename = "grr",
            },
          },
          navigation = {
            enable = true,
            keymaps = {
              goto_definition = "gnd",
              list_definitions = "gnD",
              list_definitions_toc = "gO",
              goto_next_usage = "<a-*>",
              goto_previous_usage = "<a-#>",
            },
          },
        },
      }
    end,
  }

  use {
    "ggandor/leap.nvim",
    config = function ()
      require('leap').add_default_mappings()
    end,
    requires = {
      "tpope/vim-repeat"
    }
  }

  use "nvim-treesitter/nvim-treesitter-refactor"

  use {
    'nvim-treesitter/nvim-treesitter-context',
    config = function ()
      require'treesitter-context'.setup{
        max_lines = 2,
        trim_scope = 'inner',
      }
    end
  }

  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }

  use {
    'neovim/nvim-lspconfig',
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    'mfussenegger/nvim-dap',
    'onsails/lspkind.nvim',
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
    }
  }

  use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  }

  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

  use {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup{
        text = {
          spinner = "dots_snake"
        },
        window = {
          blend = 0
        }
      }
    end
  }

  use {
    'simrat39/rust-tools.nvim',
  }

  -- LSP source for nvim-cmp
  use  {
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'ray-x/cmp-treesitter',
    'hrsh7th/cmp-nvim-lua',
    'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    'L3MON4D3/LuaSnip' -- Snippets plugin
  }

  use {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    ft = "toml",
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
        require('crates').setup()
    end,
  }

  -- Color Theme
  use 'navarasu/onedark.nvim'

  use {
    "nvim-neo-tree/neo-tree.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require'colorizer'.setup()
    end
  }

  use 'vimpostor/vim-tpipeline'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function ()
      require('gitsigns').setup()
    end,
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

  -- use 'xuhdev/vim-latex-live-preview' -- I do not need this right now

  if packer_bootstrap then
    require('packer').sync()
  end
end,


config = {
  display = {
    --open_fn = require('packer.util').float,
  }
}})

