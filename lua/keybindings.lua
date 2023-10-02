-- leader key 为空
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = { noremap = true, silent = true }

vim.keymap.set({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
vim.keymap.set({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
vim.keymap.set({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
vim.keymap.set({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")
vim.keymap.set("n", "<Leader>v", "<C-w>v", opt)
vim.keymap.set("n", "<Leader>s", "<C-w>s", opt)
vim.keymap.set("n", "<Leader>[", "<C-o>", opt)
vim.keymap.set("n", "<Leader>]", "<C-i>", opt)
-- https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })

-- 本地变量
-- local map = vim.api.nvim_set_keymap

-- 插件快捷键
-- local pluginKeys = {}

-- vim.api.nvim_set_keymap('n', '<Tab>', '<Nop>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<C-k>', '10k', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<C-j>', '10j', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<C-h>', '10h', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<C-l>', '10l', { noremap = true })

-- vim.api.nvim_set_keymap('i', '<C-k>', '<C-o>10k', { noremap = true })
-- vim.api.nvim_set_keymap('i', '<C-j>', '<C-o>10j', { noremap = true })
-- vim.api.nvim_set_keymap('i', '<C-h>', '<C-o>10h', { noremap = true })
-- vim.api.nvim_set_keymap('i', '<C-l>', '<C-o>10l', { noremap = true })

-- nvim 分屏
-- vim.api.nvim_set_keymap("n", "<leader>-", ":new <CR>", {noremap = true, silent = true, desc = "horizontal split"})
-- vim.api.nvim_set_keymap("n", "<leader>=", ":vertical new <CR>", {noremap = true, silent = true, desc = "vertical split" })
-- vim.api.nvim_set_keymap("n", "<leader>x", ":close <CR>", {noremap = true, silent = true, desc = "close current window"})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		--	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

