-- plugins/gitsigns.lua
-- Make sure you have 'lewis6991/gitsigns.nvim' installed (via lazy.nvim, packer.nvim, etc.)

return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre", -- load on file open
  config = function()
    require("gitsigns").setup {
      signs = {
        add          = {hl = 'GitGutterAdd',    text = '┃', numhl='GitGutterAddNr', linehl='GitGutterAddLn'},
        change       = {hl = 'GitGutterChange', text = '┃', numhl='GitGutterChangeNr', linehl='GitGutterChangeLn'},
        delete       = {hl = 'GitGutterDelete', text = '▁', numhl='GitGutterDeleteNr', linehl='GitGutterDeleteLn'},
        topdelete    = {hl = 'GitGutterDelete', text = '‾', numhl='GitGutterDeleteNr', linehl='GitGutterDeleteLn'},
        changedelete = {hl = 'GitGutterChange', text = '~', numhl='GitGutterChangeNr', linehl='GitGutterChangeLn'},
      },
      -- Update signs live when typing
      watch_gitdir = {
        interval = 1000,
        follow_files = true
      },
      sign_priority = 6,
      status_formatter = nil, -- Use default
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        -- Keymaps for staging/resetting hunks
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map('n', '<leader>gs', gs.stage_hunk)
        map('n', '<leader>gr', gs.reset_hunk)
        map('v', '<leader>gs', function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end)
        map('v', '<leader>gr', function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end)
        map('n', '<leader>gS', gs.stage_buffer)
        map('n', '<leader>gu', gs.undo_stage_hunk)
        map('n', '<leader>gp', gs.preview_hunk)
        map('n', '<leader>gb', function() gs.blame_line{full=true} end, { desc = "Git Blame line" })
      end,

      current_line_blame = true, -- show inline blame
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- display at end of line
        delay = 200,
      },
    }
  end
}

