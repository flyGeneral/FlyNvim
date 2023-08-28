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

    use({
      "nvim-treesitter/nvim-treesitter", commit = '4cccb6f494eb255b32a290d37c35ca12584c74d0',
      requires = {
        "p00f/nvim-ts-rainbow"
      }
    })

    -- 模糊搜索
    use("junegunn/fzf")
    use("junegunn/fzf.vim")

    --------------------- LSP 代码补全，自动提示 --------------------
    use("williamboman/nvim-lsp-installer")
    -- Lspconfig
    use("neovim/nvim-lspconfig")
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp", --neovim 内置 LSP 客户端的 nvim-cmp 源
            --以下插件可选，可以根据个人喜好删减
            "hrsh7th/cmp-buffer", --从buffer中智能提示
            "hrsh7th/cmp-nvim-lua", --nvim-cmp source for neovim Lua API.
            "hrsh7th/cmp-path", --自动提示硬盘上的文件
            "hrsh7th/cmp-calc", --输入数学算式（如1+1=）自动计算
            "hrsh7th/cmp-emoji", --输入: 可以显示表情
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-vsnip", -- vsnip
            "hrsh7th/vim-vsnip", -- vsnip
            "octaltree/cmp-look", --用于完成英语单词
            "onsails/lspkind-nvim", --美化自动完成提示信息
            "f3fora/cmp-spell" --nvim-cmp 的拼写源基于 vim 的拼写建议
        }
    }
    -- 代码段提示
    use {
        "L3MON4D3/LuaSnip",
        requires = {
            "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
            "rafamadriz/friendly-snippets" --代码段合集
        }
    }
    -- 补全引擎
    -- Snippet 引擎
    -- 补全源
    use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
    -- LSP UI 增强
    use{"glepnir/lspsaga.nvim"}
    use {'simrat39/symbols-outline.nvim'}


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
