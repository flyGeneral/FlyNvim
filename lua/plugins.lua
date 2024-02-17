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
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
    -- lspconfig
    --     --------------------- LSP 代码补全，自动提示 --------------------
    -- {"williamboman/nvim-lsp-installer"},
    -- -- Lspconfig
    -- {"neovim/nvim-lspconfig"},
    -- {
    --     "hrsh7th/nvim-cmp",
    --     dependencies = {
    --         "hrsh7th/cmp-nvim-lsp", --neovim 内置 LSP 客户端的 nvim-cmp 源
    --         --以下插件可选，可以根据个人喜好删减
    --         "hrsh7th/cmp-buffer", --从buffer中智能提示
    --         "hrsh7th/cmp-nvim-lua", --nvim-cmp source for neovim Lua API.
    --         "hrsh7th/cmp-path", --自动提示硬盘上的文件
    --         "hrsh7th/cmp-calc", --输入数学算式（如1+1=）自动计算
    --         "hrsh7th/cmp-emoji", --输入: 可以显示表情
    --         "hrsh7th/cmp-cmdline",
    --         "hrsh7th/cmp-vsnip", -- vsnip
    --         "hrsh7th/vim-vsnip", -- vsnip
    --         "octaltree/cmp-look", --用于完成英语单词
    --         "onsails/lspkind-nvim", --美化自动完成提示信息
    --         "f3fora/cmp-spell" --nvim-cmp 的拼写源基于 vim 的拼写建议
    --     },
    -- },
    -- -- 代码段提示
    -- {
    --     "L3MON4D3/LuaSnip",
    --     dependencies = {
    --         "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
    --         "rafamadriz/friendly-snippets" --代码段合集
    --     },
    -- },
    -- -- 补全引擎
    -- -- Snippet 引擎
    -- -- 补全源
    -- {"hrsh7th/cmp-nvim-lsp-signature-help" },
    -- -- LSP UI 增强
    -- {"glepnir/lspsaga.nvim"},
    -- {'simrat39/symbols-outline.nvim'},

    -- git plugin
    {
        event = "VeryLazy",
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },
    {
        event = "VeryLazy",
        "tpope/vim-fugitive",
        cmd = "Git",
        config = function()
            -- convert
            vim.cmd.cnoreabbrev([[git Git]])
            vim.cmd.cnoreabbrev([[gp Git push]])
        end,
    },
    {
        "tpope/vim-rhubarb",
        event = "VeryLazy",
    },
    {
        "rhysd/conflict-marker.vim",
        event = "VeryLazy",
    },
    -- {
    --     "nvim-treesitter/nvim-treesitter",
    --     dependencies = {
    --         "p00f/nvim-ts-rainbow"
    --     },
    -- },
    -- {
    --     "nvim-treesitter/nvim-treesitter-context",
    -- },
    {
        "ggandor/leap.nvim",
        config = function()
            require('leap').add_default_mappings()
        end,
    },

    -- lsp 代码补全
    {
        event = "VeryLazy",
        "hrsh7th/nvim-cmp",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
        },
    },

    {
        event = "VeryLazy",
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    },

    {
        event = "VeryLazy",
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
    },

    {
        "RRethy/nvim-base16",
        lazy = true,
    },

    {
        event = "VeryLazy",
        "jose-elias-alvarez/null-ls.nvim",
    },

    -- 代码段提示
    -- {
    --     "L3MON4D3/LuaSnip",
    --     dependencies = {
    --         "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
    --         "rafamadriz/friendly-snippets" --代码段合集
    --     },
    -- },

    {
       cmd = "Telescope",
       'nvim-telescope/telescope.nvim', tag = '0.1.5',
       -- or                          , branch = '0.1.x',
       dependencies = { 'nvim-lua/plenary.nvim' }
    }

})

require("mason").setup()
require("mason-lspconfig").setup()

-- Telescope
require("plugin-config.Telescope")
-- nvim-tree
require("plugin-config.nvim-tree")
-- 插件配置
-- which key
require("plugin-config.which-key")
-- 状态栏插件
require("plugin-config.lualine");
-- bufferline
require("plugin-config.bufferline")
-- -- lsp 配置
-- require("lsp.setup")
-- -- lsp auto complete
-- require('plugin-config.cmp')
-- -- 文件大纲
-- require("plugin-config.symbols-outline")
-- lsp mason
require("lsp-mason.lsp_config")
require("lsp-mason.cmp")
-- theme config
require("plugin-config.tokyonight")
-- comment
require("plugin-config.Comment")
-- nvim-treesitter
-- require("plugin-config.nvim-treesitter")
-- nvim-treesitter-context
-- require("plugin-config.nvim-treesitter-context")

-- start theme
vim.cmd[[colorscheme tokyonight]]
