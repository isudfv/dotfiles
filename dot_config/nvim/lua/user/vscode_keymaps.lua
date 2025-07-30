local vscode = require('vscode')
local map = {'n', 'v', 's', 'o'}
local nmap = {'n'}

vim.keymap.set(nmap, '<leader>n', function ()
    vscode.action("workbench.files.action.focusFilesExplorer")
end)