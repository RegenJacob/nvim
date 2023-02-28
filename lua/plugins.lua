local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "navarasu/onedark.nvim",
    config = function()
      require("style").onedark()
    end,
    priority = 1000,
    lazy = false,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        show_end_of_line = true,
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({
        text = { spinner = "dots_snake" },
        window = { blend = 0 },
      })
    end,
    lazy = false,
    event = "LspAttach",
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = { "mason-lspconfig.nvim", "j-hui/fidget.nvim" },
  },
  {
    "simrat39/rust-tools.nvim",
    lazy = true,
    config = true,
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    --enabled = false,
    config = function()
      require("lsp").cmp()
    end,
    dependencies = {
      "saecki/crates.nvim",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-path",
      "neovim/nvim-lspconfig",
      "simrat39/rust-tools.nvim",
      "hrsh7th/cmp-cmdline",
    },
  },
  { "hrsh7th/cmp-nvim-lua",                lazy = true },
  { "hrsh7th/cmp-nvim-lsp",                lazy = true },
  { "hrsh7th/cmp-cmdline",                 lazy = true },
  { "saadparwaiz1/cmp_luasnip",            lazy = true },
  { "hrsh7th/cmp-buffer",                  lazy = true },
  { "hrsh7th/cmp-path",                    lazy = true },
  { "hrsh7th/cmp-nvim-lsp-signature-help", lazy = true },
  { "L3MON4D3/LuaSnip" },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = { "williamboman/mason-lspconfig.nvim" },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("lsp").setup_null_ls()
    end,
    lazy = true,
  },
  { "williamboman/mason.nvim",           config = true },
  { "williamboman/mason-lspconfig.nvim", lazy = true,  config = true },
  {
    "jay-babu/mason-null-ls.nvim",
    config = function()
      require("mason-null-ls").setup({
        automatic_setup = true,
        automatic_installation = { exclude = { "rust_analyzer" } },
      })
      require("mason-null-ls").setup_handlers()
    end,
  },
  { "folke/which-key.nvim",  config = true },
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
  {
    "nvim-treesitter/nvim-treesitter",
    priority = 900,
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
      require("utils").treesitter()
    end,
  },
  { "nvim-treesitter/nvim-treesitter-refactor", lazy = true },
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
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    end,
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
  },
  {
    "saecki/crates.nvim",
    config = function()
      require("crates").setup({
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      })
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "neovim/nvim-lspconfig",                    lazy = true },
})
