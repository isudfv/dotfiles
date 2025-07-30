require("config.lazy")
require("user.core_keymaps")
if vim.g.vscode then
  require("user.vscode_keymaps")
end

vim.opt.foldlevel = 20
vim.opt.foldmethod = 'syntax'
-- vim.opt.foldexpr='nvim_treesitter#foldexpr()'

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

