-- 基础配置
require("basic")
-- 快捷键
require("keybindings")
-- Packer插件管理
require("plugins")
require("plugin-config.nvim-treesitter")
-- 插件配置
-- which key
require("plugin-config.which-key")
-- bufferline
require("plugin-config.bufferline")
-- nvimtree
-- require("plugin-config.nvimtree")
-- telescope 文件模糊搜索
require("plugin-config.telescope")
-- lsp 配置
require("lsp.setup")
-- lsp auto complete
require('plugin-config.cmp')
-- theme config
require("plugin-config.tokyonight")
-- require('plugin-config.vscode')
-- comment
require("plugin-config.Comment")

-- start theme
vim.cmd[[colorscheme tokyonight]]
