return {
	'stevearc/conform.nvim',
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			json = { "fixjson" }
		},
	},
	config = function()
		vim.o.formatexpr = [[v:lua.require("conform").formatexpr()]]
	end
}
