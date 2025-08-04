return {
	{ "nvim-tree/nvim-web-devicons", opts = {} },
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"folke/snacks.nvim", -- optional
		},
	},
	{
		"lewis6991/gitsigns.nvim"
	}
}
