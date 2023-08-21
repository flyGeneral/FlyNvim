-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify("正在安装Pakcer.nvim，请稍后...")
  paccker_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    -- "https://gitcode.net/mirrors/wbthomason/packer.nvim",
    install_path,
  })

  -- https://github.com/wbthomason/packer.nvim/issues/750
  local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
  end
  vim.notify("Pakcer.nvim 安装完毕")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("没有安装 packer.nvim")
  return
end

packer.startup({
  function(use)
    -- Packer 可以升级自己
    use("wbthomason/packer.nvim")
    -- nvim theme
    use ('folke/tokyonight.nvim')
    -- use ('Mofiqul/vscode.nvim') 该主题先不使用
    -- 快捷键提示
    use {"folke/which-key.nvim"}
    -------------------------- plugins -------------------------------------------
    -- nvim-tree
    -- use({
    --    "kyazdani42/nvim-tree.lua",
    --    requires = "kyazdani42/nvim-web-devicons",
    -- })
    -- use {
    --     "vim-airline/vim-airline",
    --     requires = {
    --       "vim-airline/vim-airline-themes",
    --       --综合图标支持such vim-airline lightline, vim-startify
    --       "ryanoasis/vim-devicons"
    --     }
    -- }

    -- use {
    --    "Shougo/defx.nvim",
    -- requires = {
    --       "kristijanhusak/defx-icons", -- dexf文件管理图标支持
    --       "t9md/vim-choosewin" -- 窗口选择器,可以让defx使用i打开文件
    --     }
    -- }

    -- 状态栏插件
    use {
        "nvim-lualine/lualine.nvim",
        requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    -- bufferline
    use {
        'akinsho/bufferline.nvim', tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use("numToStr/Comment.nvim")
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }

    use("liuchengxu/vista.vim")
    -- use("easymotion/vim-easymotion")
    -- -- lualine
    -- use({
    --   "nvim-lualine/lualine.nvim",
    --   requires = { "kyazdani42/nvim-web-devicons" },
    -- })
    -- use("arkav/lualine-lsp-progress")
    -- nvim-treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      commit = '4cccb6f494eb255b32a290d37c35ca12584c74d0',
    })
    -- -- dashboard-nvim
    -- use("glepnir/dashboard-nvim")
    use("junegunn/fzf")
    use("junegunn/fzf.vim")
    -- tagbar
    -- use("preservim/tagbar")
    -- -- project
    -- use("ahmedkhalf/project.nvim")
    -- -- treesitter
    -- use({
    --   "nvim-treesitter/nvim-treesitter",
    --   run = ":TSUpdate",
    -- })
    -- use("p00f/nvim-ts-rainbow")
    -- -- indent-blankline
    -- use("lukas-reineke/indent-blankline.nvim")

    -- language
    -- use 'neovim/nvim-lspconfig'
    -- use 'glepnir/lspsaga.nvim'
    -- use 'hrsh7th/cmp-nvim-lsp'
    -- use 'hrsh7th/cmp-buffer'
    -- use 'hrsh7th/cmp-path'
    -- use 'hrsh7th/cmp-cmdline'
    -- use 'hrsh7th/nvim-cmp'
    -- use 'L3MON4D3/LuaSnip'
    -- use 'nvim-treesitter/nvim-treesitter'
    -- use 'simrat39/rust-tools.nvim'
    -- use 'dnlhc/glance.nvim'

    --------------------- LSP --------------------
    use({ "williamboman/nvim-lsp-installer" })
    -- Lspconfig
    use({ "neovim/nvim-lspconfig" })
	use {'hrsh7th/cmp-nvim-lsp'}
	use {'hrsh7th/cmp-buffer'}
	use {'hrsh7th/cmp-path'}
	use {'hrsh7th/cmp-cmdline'}
	use {'hrsh7th/nvim-cmp'}
	-- vsnip
	use {'hrsh7th/cmp-vsnip'}
	use {'hrsh7th/vim-vsnip'}
    -- 常见编程语言代码段
	use {'rafamadriz/friendly-snippets'}
	-- lspkind
	use {'onsails/lspkind-nvim'}
    -- 补全引擎
    -- Snippet 引擎
    -- 补全源
    use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }

    -- LSP UI 增强
    use{"glepnir/lspsaga.nvim"}

    use {'simrat39/symbols-outline.nvim'}

    -- -- UI 增强
    -- use("onsails/lspkind-nvim")
    -- use("tami5/lspsaga.nvim")
    -- -- 代码格式化
    -- use("mhartington/formatter.nvim")
    -- use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
    -- -- TypeScript 增强
    -- use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })
    -- -- Lua 增强
    -- use("folke/lua-dev.nvim")
    -- -- JSON 增强
    -- use("b0o/schemastore.nvim")
    -- -- Rust 增强
    -- use("simrat39/rust-tools.nvim")
    -- --------------------- colorschemes --------------------
    -- -- tokyonight
    -- use("folke/tokyonight.nvim")
    -- -- OceanicNext
    -- use("mhartington/oceanic-next")
    -- -- gruvbox
    -- use({
    --   "ellisonleao/gruvbox.nvim",
    --   requires = { "rktjmp/lush.nvim" },
    -- })
    -- -- zephyr
    -- -- use("glepnir/zephyr-nvim")
    -- -- nord
    -- use("shaunsingh/nord.nvim")
    -- -- onedark
    -- use("ful1e5/onedark.nvim")
    -- -- nightfox
    -- use("EdenEast/nightfox.nvim")

    -- -------------------------------------------------------
    -- use({ "akinsho/toggleterm.nvim" })
    -- -- surround
    -- use("ur4ltz/surround.nvim")
    -- -- Comment
    -- use("numToStr/Comment.nvim")
    -- -- nvim-autopairs
    -- use("windwp/nvim-autopairs")
    -- -- git
    -- use({ "lewis6991/gitsigns.nvim" })
    -- -- vimspector
    -- use("puremourning/vimspector")
    -- ----------------------------------------------
    -- use("mfussenegger/nvim-dap")
    -- use("theHamsta/nvim-dap-virtual-text")
    -- use("rcarriga/nvim-dap-ui")
    -- -- use("Pocco81/DAPInstall.nvim")
    -- -- use("jbyuki/one-small-step-for-vimkind")

    -- use("j-hui/fidget.nvim")
    if paccker_bootstrap then
      packer.sync()
    end
  end,
  config = {
    -- 锁定插件版本在snapshots目录
    -- snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots"),
    -- 这里锁定插件版本在v1，不会继续更新插件
    -- snapshot = "v1",

    -- 最大并发数
    max_jobs = 16,
    -- 自定义源
    git = {
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      -- default_url_format = "https://gitclone.com/github.com/%s",
    },
    display = {
    -- 使用浮动窗口显示
       open_fn = function()
       return require("packer.util").float({ border = "single" })
       end,
    },
  },
})

-- 每次保存 plugins.lua 自动安装插件
-- move to autocmds.lua
-- pcall(
--   vim.cmd,
--   [[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugins.lua source <afile> | PackerSync
-- augroup end
-- ]]
-- )
