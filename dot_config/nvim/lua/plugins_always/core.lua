return {
    { "wellle/targets.vim" },
    { "vim-scripts/ReplaceWithRegister" },
    {
        "kylechui/nvim-surround",
        version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    { 
        "ggandor/leap.nvim",
        config = function ()
            vim.keymap.set({'n', 'x'}, 's', '<Plug>(leap)')
            vim.keymap.set('n',        'S', '<Plug>(leap-from-window)')
            vim.keymap.set('o',        's', '<Plug>(leap-forward)')
            vim.keymap.set('o',        'S', '<Plug>(leap-backward)')
        end,
    },
    -- {
    --     "easymotion/vim-easymotion",
    --     config = function ()
    --         vim.keymap.set({'n', 'x'}, 's', '<Plug>(easymotion-sn)')
    --     end,
    -- }
    { 'vuciv/golf' },
	{
		'numToStr/Comment.nvim',
		opts = {
			-- add any options here
		}
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	}
}
