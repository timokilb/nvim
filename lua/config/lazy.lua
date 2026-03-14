-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.equalalways = false

vim.opt.expandtab = true   -- Use spaces instead of actual tab characters
vim.opt.tabstop = 4        -- Display width of a tab character
vim.opt.shiftwidth = 4     -- Number of spaces to use for autoindent
vim.opt.softtabstop = 4    -- Number of spaces a <Tab> counts for while editing
-- Force the .tf and .tfvars extensions to be recognized as 'terraform' filetype
if vim.filetype then
  vim.filetype.add({
    extension = {
      tf = 'terraform',
      tfvars = 'terraform', -- good for tfvars files too
    },
  })
end
-- Terraform → 2 spaces
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "terraform" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

vim.opt.clipboard = "unnamedplus"

require("keymaps")

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "catppuccin" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
  ui = {
    icons = {
      loaded = "Hallo"
    }
  }
})
-- Background transparency configurations
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
-- vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
-- vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
-- vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
-- vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })
-- vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
-- 
-- -------- NVIM TREE --------
-- -- NvimTree transparency
-- vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NvimTreeFolderName", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { bg = "none" })
