-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- leader key 为空
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
  noremap = true,
  silent = true,
}

-- 插件快捷键
local pluginKeys = {}


-- vim.api.nvim_set_keymap('n', '<Tab>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '10k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '10j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '10h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '10l', { noremap = true })

-- vim.api.nvim_set_keymap('i', '<C-k>', '<C-o>10k', { noremap = true })
-- vim.api.nvim_set_keymap('i', '<C-j>', '<C-o>10j', { noremap = true })
-- vim.api.nvim_set_keymap('i', '<C-h>', '<C-o>10h', { noremap = true })
-- vim.api.nvim_set_keymap('i', '<C-l>', '<C-o>10l', { noremap = true })


-- nvim 分屏
vim.api.nvim_set_keymap("n", "<leader>-", ":new <CR>", {noremap = true, silent = true, desc = "horizontal split"})
vim.api.nvim_set_keymap("n", "<leader>=", ":vertical new <CR>", {noremap = true, silent = true, desc = "vertical split" })
vim.api.nvim_set_keymap("n", "<leader>x", ":close <CR>", {noremap = true, silent = true, desc = "close current window"})


