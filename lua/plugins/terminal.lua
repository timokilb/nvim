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
    local terminal = Terminal:new({
      direction = "float",
      hidden = true,  -- don't list it when cycling through terminals
      on_open = function(terminal)
        vim.cmd("startinsert!")
      end,
    })

    -- Keymap: toggle the same terminal instance
    vim.keymap.set("n", "<leader>tf", function()
      terminal:toggle()
    end, { desc = "Open Terminal" })

    vim.keymap.set('t', '<Esc>', function()
      terminal:toggle()
    end, { desc = 'Exit terminal mode' })
  end
}
