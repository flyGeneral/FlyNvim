require("symbols-outline").setup({
    width = 20,
})


vim.api.nvim_set_keymap("n", "<leader>m", ":SymbolsOutline<CR>", {noremap = true, silent = true, desc = "toggle SymbolsOutline" })