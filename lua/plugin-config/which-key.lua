-- require("which-key").setup({})
local wk = require("which-key")
wk.register({
    ["<leader>"] = {
        f = {
            name = "fzf", -- 指定该快捷键组的名称
            -- f = {"find file"}, -- 创建新的快捷键绑定
            -- a = {"Ag search"}
        },
        b = {
            name = "bufferline", -- 指定该快捷键组的名称
        },
        n = {
            name = "NvimTree", --打开目录树
        },
    }
}, {silent = true, noremap = true})
