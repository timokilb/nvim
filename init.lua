vim.pack.add({
    {
        -- grab language server configs from remote repository
        src = "https://github.com/neovim/nvim-lspconfig"
    },
	{
        -- installer for language servers
        src = "https://github.com/mason-org/mason.nvim"
    },
	{
        -- bridge mason and nvim-lspconfig
        src = "https://github.com/mason-org/mason-lspconfig.nvim"
    },
	{
        -- make mason-lspconfig install not only language servers
        src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim"
    },
	{
        -- parse the file tree
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
    {
        -- great file navigation
        src = "https://github.com/nvim-telescope/telescope.nvim"
    },
    {
        -- telescope dependency
        src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    },
    {
        -- telescope dependency
        src = "https://github.com/nvim-lua/plenary.nvim"
    },
    {
        -- oil for file exploration
        src = "https://github.com/stevearc/oil.nvim"
    },
    {
        -- which key for keymap cheat sheets
        src = "https://github.com/folke/which-key.nvim"
    },
    {
        -- which key for keymap cheat sheets
        src = "https://www.github.com/lewis6991/gitsigns.nvim"
    }
})

vim.cmd.colorscheme("catppuccin")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Vim options https://neovim.io/doc/user/options/#_3.-options-summary
vim.opt.number = true -- Display line numbers
vim.opt.relativenumber = true -- Make line numbers relative to cursor position
vim.opt.cursorline = true   -- Highlight current line
vim.opt.scrolloff = 12 -- Keep a healthy distance to the bottom
vim.opt.sidescrolloff = 12 -- Keep a healthy distance to the bottom

vim.opt.clipboard = "unnamedplus" -- Enable pasting from clipboard using p

vim.opt.tabstop = 4        -- Display width of a tab character
vim.opt.shiftwidth = 4     -- Number of spaces to use for autoindent
vim.opt.softtabstop = 4    -- Number of spaces a <Tab> counts for while editing
vim.opt.smartindent = true    -- Smart auto indentation
vim.opt.autoindent = true    -- Copy identation from current line
vim.opt.equalalways = false -- Prevent automatic window resizing
vim.opt.expandtab = true   -- Use spaces instead of actual tab characters

vim.opt.showmode = false -- Don't show vim mode (insert, visual etc.)

vim.opt.autoread = true -- Automatically read file changes to buffer
vim.opt.autowrite = false -- Prevent auto save
vim.opt.modifiable = true -- allow buffer modifications

vim.opt.mouse = "a"
vim.opt.encoding = "utf-8"

vim.keymap.set("n", "<leader>c", ":nohsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>l", "<C-w>l")
vim.keymap.set("n", "<leader>v", ":vsplit<CR>")
vim.keymap.set("n", "<leader>x", function()
    vim.cmd("bd")
end, { desc = "Close current buffer" })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up"}) -- Keep cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down"}) -- Keep cursor centered

vim.keymap.set("n", "<leader>j", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<leader>j", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<leader>k", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- required to do https://github.com/mason-org/mason.nvim?tab=readme-ov-file#installation--usage
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup()
-- https://mason-registry.dev/registry/list or run :Mason
-- https://github.com/mason-org/mason-registry/tree/main/packages
require("mason-tool-installer").setup({
    ensure_installed = {
        -- Language Servers
        "lua_ls", -- lua
        "bashls", -- bash
        "rust_analyzer", -- rust
        "pyright", -- python
        "ts_ls", -- typescript
        "clangd" -- c
    },
})

require("nvim-treesitter").install({
    ensure_installed = {
        "lua",
        "vim",
        "bash",
        "rust",
        "python",
        "javascript",
        "typescript",
        "json"
    }
})

require("telescope").setup({})
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "Telescope LSP definitions" })

require("which-key").setup({})

require("oil").setup()

-- autocommands
--
-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.lsp.config("lua_ls", {})
vim.lsp.config("bashls", {})
vim.lsp.config("rust_analyzer", {})
vim.lsp.config("pyright", {})
vim.lsp.config("ts_ls", {})
vim.lsp.config("clangd", {})


vim.lsp.enable({
    "lua_ls", -- lua
    "bashls", -- bash
    "rust_analyzer", -- rust
    "pyright", -- python
    "ts_ls", -- typescript
    "clangd" -- c
})
--emergency button: delete caches
--rm -rf ~/.local/share/nvim
--rm -rf ~/.local/state/nvim
--rm -rf ~/.cache/nvim

