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
      theme = "onedark",
      component_separators = { left = "", right = "" },
      section_separators = { left = " ", right = "" },
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
      lualine_x = { --[["encoding", "fileformat",--]] "filetype" },
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

function M.tabby()
  vim.opt.showtabline = 2
  local theme = {
    fill = "lualine_c_normal",
    --Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
    head = "lualine_b_normal",
    current_tab = "lualine_a_insert",
    tab = "lualine_b_normal",
    win = "lualine_b_normal",
    tail = "lualine_b_normal",
  }
  require("tabby.tabline").set(function(line)
    return {
      {
        { "  ", hl = theme.head },
        line.sep("", theme.head, theme.fill),
      },
      line.tabs().foreach(function(tab)
        local hl = tab.is_current() and theme.current_tab or theme.tab
        return {
          line.sep("", hl, theme.fill),
          --tab.is_current() and "" or "",
          tab.number(),
          tab.name(),
          tab.close_btn(""),
          line.sep("", hl, theme.fill),
          hl = hl,
          margin = " ",
        }
      end),
      line.spacer(),
      line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
        return {
          line.sep("", theme.win, theme.fill),
          --win.is_current() and "" or "",
          win.buf_name(),
          line.sep("", theme.win, theme.fill),
          hl = theme.win,
          margin = " ",
        }
      end),
      {
        line.sep("", theme.tail, theme.fill),
        { "  ", hl = theme.tail },
      },
      hl = theme.fill,
    }
  end)
end

return M
