return {
	-- { 'rebelot/kanagawa.nvim' },
	{
		"sainnhe/gruvbox-material",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.gruvbox_material_enable_italic = true
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
	{
		"miikanissi/modus-themes.nvim",
		enabled = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("modus")
		end,
	},
	{
		"m00qek/baleia.nvim",
		version = "*",
		enabled = false,
		config = function()
			vim.g.baleia = require("baleia").setup({ log = "DEBUG" })

			-- Command to colorize the current buffer
			vim.api.nvim_create_user_command("BaleiaColorize", function()
				vim.g.baleia.once(vim.api.nvim_get_current_buf())
			end, { bang = true })

			-- Command to show logs
			vim.api.nvim_create_user_command("BaleiaLogs", vim.g.baleia.logger.show, { bang = true })
			-- auto coloize  quickfix
			vim.api.nvim_create_autocmd({ "BufReadPost" }, {
				pattern = "quickfix",
				callback = function()
					vim.api.nvim_set_option_value("modifiable", true, { buf = buffer })
					vim.g.baleia.automatically(vim.api.nvim_get_current_buf())
					vim.api.nvim_set_option_value("modified", false, { buf = buffer })
					vim.api.nvim_set_option_value("modifiable", false, { buf = buffer })
				end,
			})
		end,
	},
	{
		"xeind/nightingale.nvim",
		enabled = true,
		priority = 1000,
		config = function()
			require("nightingale").setup({
				-- Custom color overrides
				overrides = function(colors)
					local theme = colors.theme
					return {
						Visual = { bg = "#464646" },
					}
				end,
			})
			vim.cmd.colorscheme("nightingale")
		end,
	},
}
