-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {   "folke/tokyonight.nvim" },
    {   "folke/which-key.nvim"  },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons", opt = true},
    },
    { 
        "akinsho/bufferline.nvim", version = "*", 
        dependencies = "nvim-tree/nvim-web-devicons"
    },
    {   
        "numToStr/Comment.nvim",
        event = "VeryLazy",
    },
    { 
        "nvim-tree/nvim-tree.lua",
        event = "VeryLazy",
        dependencies = "nvim-tree/nvim-web-devicons",
        tag = "nightly"
    },
    {
        "junegunn/fzf",
        event = "VeryLazy",
        dependencies = "junegunn/fzf.vim"
    },
    {   
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
})


-- 代码高亮
-- require("plugin-config.nvim-treesitter")
-- nvim-tree
require("plugin-config.nvim-tree")
-- 文件大纲
-- require("plugin-config.symbols-outline")
-- 插件配置
-- which key
require("plugin-config.which-key")
-- fzf config
require("plugin-config.fzf")
-- 状态栏插件
require("plugin-config.lualine");
-- bufferline
require("plugin-config.bufferline")
-- nvimtree
-- require("plugin-config.nvimtree")
-- telescope 文件模糊搜索
-- require("plugin-config.telescope")
-- lsp 配置
-- require("lsp.setup")
-- lsp auto complete
-- require('plugin-config.cmp')
-- theme config
require("plugin-config.tokyonight")
-- require('plugin-config.vscode')
-- comment
require("plugin-config.Comment")

-- start theme
vim.cmd[[colorscheme tokyonight]]
