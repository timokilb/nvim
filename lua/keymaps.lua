-- In terminal mode, map <Esc> to go back to normal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
-- Open a terminal in a horizontal split with <leader>c

-- in your init.lua
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")
-- Open a terminal at the bottom, 1/4 height
vim.keymap.set("n", "<leader>c", function()
  -- calculate 1/4 of current window height
  local height = math.floor(vim.o.lines / 4)
  -- open horizontal split at the bottom
  vim.cmd("belowright " .. height .. "split")
  -- open terminal in the new split
  vim.cmd("terminal")
  -- automatically enter terminal mode
  vim.cmd("startinsert")
end, { desc = "Open terminal at bottom (1/4 height)" })

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
