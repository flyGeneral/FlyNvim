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


-- nvim common keybindings
-- 在 copy 后高亮
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
        pattern = { "*" },
        callback = function()
                vim.highlight.on_yank({
                        timeout = 300,
                })
        end,
})

-- nvim panel move
vim.keymap.set("n", "<C-l>", "<C-w>l", opt)
vim.keymap.set("n", "<C-h>", "<C-w>h", opt)
vim.keymap.set("n", "<C-j>", "<C-w>j", opt)
vim.keymap.set("n", "<C-k>", "<C-w>k", opt)
-- https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })

-- nvim split screen
vim.keymap.set("n", "<Leader>v", "<C-w>v", opt)
vim.keymap.set("n", "<Leader>s", "<C-w>s", opt)

vim.api.nvim_set_keymap("n", "<leader>-", ":new <CR>", {noremap = true, silent = true, desc = "horizontal split"})
vim.api.nvim_set_keymap("n", "<leader>=", ":vertical new <CR>", {noremap = true, silent = true, desc = "vertical split" })
vim.api.nvim_set_keymap("n", "<leader>x", ":close <CR>", {noremap = true, silent = true, desc = "close current window"})


