
return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
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

    end,
  }
}
