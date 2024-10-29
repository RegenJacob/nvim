local M = {}

function M.general()
  vim.g.mapleader = "ö"
end

function M.lsp(bufnr)
  vim.keymap.set("n", "<Leader>F", vim.lsp.buf.format, { buffer = bufnr })
end

function M.telescope()
  local telescope = require("telescope.builtin")
  vim.keymap.set("n", "<Leader>ss", function()
    telescope.find_files()
  end, { desc = "Telescope file search" })

  vim.keymap.set("n", "<Leader>sr", function()
    telescope.oldfiles()
  end, { desc = "Telescope recent Files" })

  vim.keymap.set("n", "<Leader>gl", function()
    telescope.git_commits()
  end, { desc = "Telescope git commits" })

  vim.keymap.set("n", "?", function()
    telescope.current_buffer_fuzzy_find()
  end, { desc = "Telescope current buffer fuzzy find" })
end

function M.lspsaga()
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>")
  vim.keymap.set("n", "<Leader>a", "<cmd>Lspsaga code_action<cr>")
  vim.keymap.set("n", "<Leader>l", "<cmd>Lspsaga peek_definition<cr>")
  vim.keymap.set("n", "<Leader>dn", "<cmd>Lspsaga diagnostic_jump_next<cr>")
  vim.keymap.set("n", "<Leader>dN", "<cmd>Lspsaga diagnostic_jump_prev<cr>")
end

function M.hop()
  local hop = require('hop')
  local directions = require('hop.hint').HintDirection
  vim.keymap.set('', 'f', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
  end, { remap = true })
  vim.keymap.set('', 'F', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
  end, { remap = true })
end

return M
