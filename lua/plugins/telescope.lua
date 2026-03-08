return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build= 'make' }
	},
	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
		    -- Open files in your nvim config
		vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "Telescope LSP definitions" })
		vim.keymap.set('n', '<leader>fc', function()
			builtin.find_files({ cwd = vim.fn.stdpath('config') })
		end, { desc = 'Telescope find files (nvim config)' })
	end
}
-- todo: write readme and also mention that you need to  install the live grep dependency
