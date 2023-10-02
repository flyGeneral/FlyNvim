-- local set = vim.o
require("basic")
-- keybindings
require("keybindings")
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
		"windwp/nvim-autopairs",
		event = "VeryLazy",
		config = function()
			require("nvim-autopairs").setup({})
		end,
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
		"folke/neodev.nvim",
	},
  {
    "RRethy/nvim-base16",
    lazy = true,
  },
  {
    "junegunn/fzf",
    event = "VeryLazy",
    keys = {
      { "<leader>ff", ":Files<CR>", desc = "fzf find files" },
      { "<leader>fa", ":Ag<CR>", desc = "fzf Ag Text" },
    },
    dependencies = {"junegunn/fzf.vim"},
  },
})
vim.cmd.colorscheme("base16-tender")

require("mason").setup()
require("mason-lspconfig").setup()

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("neodev").setup({
	-- add any options here, or leave empty to use the default settings
})

require("lsp-config.cmp")
require("lsp-config.lspconfig")
