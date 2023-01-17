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
    init = function()
      print("e?")
      --require("style").onedark()
    end,
    priority=1000,
    lazy = false
  },

  { 
    "nvim-treesitter/nvim-treesitter",
    priority=900,
    lazy = false,
    build = ":TSUpdate"
  },

  {
    "saecki/crates.nvim",
    ft = "toml",
    event = "BufRead Cargo.toml",
    dependencies = {
      "nvim-lua/plenary.nvim"
    }
  },


})
