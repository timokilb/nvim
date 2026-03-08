-- lua/plugins/toggleterm.lua
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]], -- default keybinding
      direction = "float",      -- default terminal direction
      float_opts = {
        border = "curved",
        winblend = 0,
      },
    })

    -- Create one persistent terminal instance
    local Terminal = require("toggleterm.terminal").Terminal
    local float_term = Terminal:new({
      direction = "float",
      hidden = true,  -- don't list it when cycling through terminals
    })

    -- Keymap: toggle the same terminal instance
    vim.keymap.set("n", "<leader>tf", function()
      float_term:toggle()
    end, { desc = "Toggle floating terminal" })

    -- (Optional) add another keymap for horizontal or vertical split terminals
    vim.keymap.set("n", "<leader>th", function()
      float_term:toggle(20, "horizontal")
    end, { desc = "Toggle horizontal terminal" })
          -- Scratchpad
    local scratch = Terminal:new({
      cmd = "nvim ~/scratchpad.txt",
      direction = "float",
      hidden = true,
      id = 13,
        float_opts = { border = "curved" },
    })
    vim.keymap.set("n", "<leader>tx", function() scratch:toggle() end, { desc = "Floating scratchpad" })
  end,
}
