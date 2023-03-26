local M = {}

function M.onedark()
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
end

function M.lualine()
  require("lualine").setup({
    options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = " ", right = " " },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  })
end

return M
