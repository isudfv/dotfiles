return {
	{ "nvim-tree/nvim-web-devicons", opts = {} },
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"folke/snacks.nvim", -- optional
		},
		keys = {
			{
				"<leader>td",
				function()
					if next(require('diffview.lib').views) == nil then
						vim.cmd('DiffviewOpen')
					else
						vim.cmd('DiffviewClose')
					end
				end,
				desc = "toggle diffview"
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim"
	}
}
