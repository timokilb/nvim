-- In terminal mode, map <Esc> to go back to normal mode
-- vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
-- Open a terminal in a horizontal split with <leader>c

-- in your init.lua
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

-- Close current buffer safely with <leader>x
vim.keymap.set("n", "<leader>x", function()
  -- force close the buffer
  vim.cmd("bd!")
end, { desc = "Close current buffer (force)" })

vim.keymap.set("n", "<leader>v", "<cmd>vsplit<cr>")

--vim.keymap.set("n", "<leader>d", require("diffview").open())
--vim.keymap.set("n", "<leader>d", function()
--    require("diffview").open()
--end, { desc = "git diff" })
