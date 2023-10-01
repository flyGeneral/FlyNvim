-- leader key 为空
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = { noremap = true, silent = true }

vim.keymap.set({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
vim.keymap.set({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
vim.keymap.set({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
vim.keymap.set({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")
vim.keymap.set("n", "<Leader>v", "<C-w>v", opt)
vim.keymap.set("n", "<Leader>s", "<C-w>s", opt)
vim.keymap.set("n", "<Leader>[", "<C-o>", opt)
vim.keymap.set("n", "<Leader>]", "<C-i>", opt)
-- https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })

-- 本地变量
-- local map = vim.api.nvim_set_keymap

-- 插件快捷键
-- local pluginKeys = {}

-- vim.api.nvim_set_keymap('n', '<Tab>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '10k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '10j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '10h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '10l', { noremap = true })

vim.api.nvim_set_keymap('i', '<C-k>', '<C-o>10k', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<C-o>10j', { noremap = true })
-- vim.api.nvim_set_keymap('i', '<C-h>', '<C-o>10h', { noremap = true })
-- vim.api.nvim_set_keymap('i', '<C-l>', '<C-o>10l', { noremap = true })

-- nvim 分屏
-- vim.api.nvim_set_keymap("n", "<leader>-", ":new <CR>", {noremap = true, silent = true, desc = "horizontal split"})
-- vim.api.nvim_set_keymap("n", "<leader>=", ":vertical new <CR>", {noremap = true, silent = true, desc = "vertical split" })
-- vim.api.nvim_set_keymap("n", "<leader>x", ":close <CR>", {noremap = true, silent = true, desc = "close current window"})


-- return pluginKeys
