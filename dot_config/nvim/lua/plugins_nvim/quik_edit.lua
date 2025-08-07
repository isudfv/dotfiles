return {
	{
		"gbprod/substitute.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		config = function()
			-- vim.keymap.set({ "n", "x" }, "gr", require('substitute').operator, { noremap = true, desc = "substitute" })
			-- vim.keymap.set("n", "grr", require('substitute').line, { noremap = true, desc = "substitute line" })
			-- vim.keymap.set("n", "X", require('substitute').eol, { noremap = true })
			-- vim.keymap.set("x", "x", require('substitute').visual, { noremap = true })
			vim.keymap.set({ "n", "x" }, "cx", require('substitute.exchange').operator, { noremap = true, desc = "exchange" })
			vim.keymap.set("n", "cxx", require('substitute.exchange').line, { noremap = true, desc = "exchange line" })
			require('substitute').setup()
		end
	}
}
