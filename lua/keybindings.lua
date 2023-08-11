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

-- 本地变量
local map = vim.api.nvim_set_keymap

-- 插件快捷键
local pluginKeys = {}



-- Telescope 命令模式快捷键
map("n", "<leader>tff", ":Telescope find_files<CR>", opt)
map("n", "<leader>tfg", ":Telescope live_grep<CR>", opt)
map("n", "<leader>tfb", ":Telescope buffers<CR>", opt)
map("n", "<leader>tfh", ":Telescope help_tags<CR>", opt)
map("n", "<leader>tsf", ":Telescope file_browser<CR>", opt)
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<C-n>"] = "move_selection_next",
    ["<C-p>"] = "move_selection_previous",
    -- 历史记录
    ["<Down>"] = "cycle_history_next",
    ["<Up>"] = "cycle_history_prev",
    -- 关闭窗口
    -- ["<esc>"] = actions.close,
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

-- fzf 命令模式快捷键
map("n", "<leader>ff", ":Files <CR>", opt)
map("n", "<leader>fa", ":Ag <CR>", opt)


return pluginKeys
