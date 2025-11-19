return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		dependencies = {
			{ 'DrKJeff16/wezterm-types', lazy = true },
		},
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				{ path = 'wezterm-types',      mods = { 'wezterm' } },
			},
		},
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function()
					vim.keymap.set('n', 'K', vim.lsp.buf.hover)
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
					vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = "open diagnostic" })
					vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "open code action" })
					vim.keymap.set("n", "<leader>dq", function()
						vim.diagnostic.setqflist()
						vim.cmd("copen")
					end, { desc = "Diagnostics → Quickfix" })
				end
			})
			vim.lsp.config('lua_ls', {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }, -- prevent "undefined global 'vim'"
						},
					},
				},
				single_file_support = true,
			})
			vim.lsp.config('qmlls', {
				cmd = { 'qmlls' },
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		-- lazy = true,
		event = "BufEnter",
		opts = {
			-- ensure_installed = { "lua_ls", "clangd", "fixjson" },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	}
}
