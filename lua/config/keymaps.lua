
  vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set('n', '<C-s>', function()
  vim.cmd('write')          -- Save the file
  vim.lsp.buf.format()      -- Format the file using LSP (if available)
end, { desc = "Save and format the file" })

vim.keymap.set('i', '<C-s>', function()
  vim.cmd('write')          -- Save the file
  vim.lsp.buf.format()      -- Format the file using LSP (if available)
end, { desc = "Save and format the file", silent = true })
