local M = {}

function M.general()
  vim.g.mapleader = "ö"
end

function M.lsp(bufnr)
  print(bufnr)
  vim.keymap.set("n", "<Leader>F", vim.lsp.buf.format, { buffer = bufnr })
end

function M.lspsaga()
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>")
  vim.keymap.set("n", "<Leader>a", "<cmd>Lspsaga code_action<cr>")
  vim.keymap.set("n", "<Leader>l", "<cmd>Lspsaga peek_definition<cr>")
end

return M
