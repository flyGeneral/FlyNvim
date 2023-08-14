vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
        mode = "buffer",
        -- 显示id
        number = "ordinal",
		offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left"
            }
        }
    }
}

-- 快速在buffer间跳转
vim.api.nvim_set_keymap("n", "<leader>b1", ":BufferLineGoToBuffer 1<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>b2", ":BufferLineGoToBuffer 2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>b3", ":BufferLineGoToBuffer 3<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>b4", ":BufferLineGoToBuffer 4<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>b5", ":BufferLineGoToBuffer 5<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>b6", ":BufferLineGoToBuffer 6<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>b7", ":BufferLineGoToBuffer 7<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>b8", ":BufferLineGoToBuffer 8<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>b9", ":BufferLineGoToBuffer 9<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>bg", ":BufferLinePick", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "bn", ":BufferLineCycleNext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "bp", ":BufferLineCyclePrev<CR>", {noremap = true, silent = true})

--- 配置tabline快捷键，主要以 t开头代表 t
--- 关闭当前标签页
vim.api.nvim_set_keymap("n", "tc", ":tabclose<CR>", {noremap = true, silent = true})
--- 关闭所有标签页，仅保留当前标签页
vim.api.nvim_set_keymap("n", "to", ":tabonly<CR>", {noremap = true, silent = true})
--- gt 切换到下一个，gT切换到上一个
