vim.api.nvim_set_keymap("n", "<leader>ff", ":Files <CR>", {noremap = true, silent = true, desc = "fzf find"})
vim.api.nvim_set_keymap("n", "<leader>fa", ":Ag <CR>", {noremap = true, silent = true, desc = "fzf Ag" })
