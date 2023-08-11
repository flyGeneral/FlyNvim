-- require("which-key").setup({})
local wk = require("which-key")
wk.register({
    ["<leader>"] = {
        f = {
            name = "fzf quick key", -- 指定该快捷键组的名称
            f = {"find file"}, -- 创建新的快捷键绑定
            a = {"Ag search character string"}
        }
    }
}, {silent = true, noremap = true})
