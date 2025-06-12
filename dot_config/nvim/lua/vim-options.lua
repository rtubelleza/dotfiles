-- Base vim settings
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.mouse = "a"

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
-- Sync to system clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 400

-- dont ask about existing swap files
vim.opt.shortmess:append("A")

-- handled by lualine
vim.opt.showmode = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- indentation
vim.opt.smartindent = true
vim.opt.smartcase = true

vim.opt.laststatus = 3
