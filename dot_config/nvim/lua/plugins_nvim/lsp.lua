return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function()
					vim.keymap.set('n', 'K', vim.lsp.buf.hover)
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
					vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float)
				end
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			-- ensure_installed = { "lua_ls", "clangd", "fixjson" },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	}
}
