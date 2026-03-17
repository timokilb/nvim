return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Basic setup
    require("nvim-tree").setup({
        filters = {
            dotfiles = false,
            git_ignored = false,
            custom = { ".DS_Store" },
        },
        actions = {
            open_file = {
                quit_on_open = true,  -- Automatically close tree after opening a file
            },
        },
    })

    -- Keymap to toggle
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })
  end,
}
