require("nvim-tree").setup({
  sort_by = "case_sensitive",
  system_open = {
    cmd = "open",
  },
  view = {
    width = 25,
    -- adaptive_size = true,
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        git = true,
        file = true,
        folder = true,
        folder_arrow = true,
      },
      glyphs = {
        bookmark = " ",
        folder = {
          arrow_closed = "⏵",
          arrow_open = "⏷",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "⌥",
          renamed = "➜",
          untracked = "★",
          deleted = "⊖",
          ignored = "◌",
        },
      },
    },
  },
  filters = {
    dotfiles = false,
  },
})

vim.api.nvim_set_keymap("n", "<leader>nn", ":NvimTreeToggle<CR>", {noremap = true, silent = true, desc = "Open NvimTree" })
vim.api.nvim_set_keymap("n", "<leader>no", ":NvimTreeOpen<CR>", {noremap = true, silent = true, desc = "Open NvimTree" })
vim.api.nvim_set_keymap("n", "<leader>nf", ":NvimTreeFocus<CR>", {noremap = true, silent = true, desc = "Focus NvimTree" })