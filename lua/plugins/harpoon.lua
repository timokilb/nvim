return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        local function map(lhs, rhs, opts) vim.keymap.set('n', lhs, rhs, opts or {}) end

        -- Add files to the Harpoon list
        map('<leader>pa', function() harpoon:list():add() end)

        -- Toggle the Harpoon quick menu
        map('<leader>pf', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        -- Harpoon buffer navigation using Ctrl-n, Ctrl-e, Ctrl-i, Ctrl-o
        map('<leader>pq', function() harpoon:list():select(1) end, { desc = 'Harpoon Buffer 1' })
        map('<leader>pw', function() harpoon:list():select(2) end, { desc = 'Harpoon Buffer 2' })
        map('<leader>pe', function() harpoon:list():select(3) end, { desc = 'Harpoon Buffer 3' })
        map('<leader>pr', function() harpoon:list():select(4) end, { desc = 'Harpoon Buffer 4' })
    end,
}
