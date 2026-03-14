return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- runs after install/update
    config = function()
      require("nvim-treesitter.configs").setup({
	    ensure_installed = { "lua", "vim", "bash", "rust", "python", "json" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}

