local map = {'n', 'v', 's', 'o'}
local nmap = {'n'}

vim.keymap.set(map, 'H', '^')
vim.keymap.set(map, 'L', 'g_')
vim.keymap.set(nmap, '<leader>l', ':noh<CR>')
