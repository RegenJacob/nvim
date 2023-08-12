return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function ()
      require("onedark").setup({
        transparent = not vim.g.neovide == true, -- dissable transparency on neovide
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
    "Johan-Palacios/onedarker",
    priority = 1000,
    enabled = true,
    lazy = false,
    config = function()
      vim.cmd("colorscheme onedarker")
    end,
  },
}
