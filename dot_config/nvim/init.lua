require("config.lazy")
require("user.core_keymaps")
if vim.g.vscode then
  require("user.vscode_keymaps")
end

vim.opt.autochdir = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.hls = true
vim.opt.wildignorecase = true
vim.opt.winborder = 'rounded'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 400 }
  end
})
-- restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.api.nvim_win_set_cursor(0, mark)
			-- defer centering slightly so it's applied after render
			vim.schedule(function()
				vim.cmd("normal! zz")
			end)
		end
	end,
})
