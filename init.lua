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
    "RRethy/nvim-base16",
    lazy = true,
  },
  {
    "junegunn/fzf",
    keys = {
      { "<leader>ff", ":Files<CR>", desc = "fzf find files" },
      { "<leader>fa", ":Ag<CR>", desc = "fzf Ag Text" },
    },
    dependencies = {"junegunn/fzf.vim"},
  },
})
vim.cmd.colorscheme("base16-tender")
