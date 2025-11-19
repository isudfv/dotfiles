local map = {'n', 'v', 's', 'o'}
local nmap = {'n'}

vim.keymap.set(map, 'H', '^')
vim.keymap.set(map, 'L', 'g_')
vim.keymap.set(nmap, '<leader>l', ':noh<CR>')
vim.keymap.set(nmap, 'U', '<C-r>')
vim.keymap.set(nmap, '<leader>cf', function()
	local filepath = vim.fn.expand('%:t')
	vim.fn.setreg('+', filepath)
	print('Copied file path: ' .. filepath)
end, { desc = 'Copy file name' })

vim.keymap.set(
	nmap,
	'<leader>cl',
	function()
		local filepath = vim.fn.expand('%:t')
		local line_num = vim.fn.line('.')
		local file_with_line = filepath .. ':' .. line_num
		vim.fn.setreg('+', file_with_line)
		print('Copied file path with line: ' .. file_with_line)
	end,
	{ desc = 'Copy file name:line' }
)
-- save relative number jumps to jumplists.
vim.keymap.set("n", "k", function() return vim.v.count > 0 and "m'" .. vim.v.count .. "k" or "gk" end, { expr = true })
vim.keymap.set("n", "j", function() return vim.v.count > 0 and "m'" .. vim.v.count .. "j" or "gj" end, { expr = true })
