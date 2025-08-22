-- lua/plugins/toggleterm.lua
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]], -- keep default if you like
      direction = "float",      -- default terminal direction
      float_opts = {
        border = "curved",
        winblend = 0,
      },
    })

    -- Keymap for floating terminal
    vim.keymap.set("n", "<leader>tf", function()
      require("toggleterm.terminal").Terminal
        :new({ direction = "float" })
        :toggle()
    end, { desc = "Toggle floating terminal" })
  end,
}

