return {
	{
		'Wansmer/treesj',
		dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
		config = function()
			require('treesj').setup()
			vim.keymap.set('n', '<leader>tj', require('treesj').toggle, { desc = "toggle join"})
		end,
	},
	{
		"chrisgrieser/nvim-origami",
		event = "VeryLazy",
		opts = {}, -- needed even when using default config

		-- recommended: disable vim's auto-folding
		init = function()
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 99
		end,
	}
}
