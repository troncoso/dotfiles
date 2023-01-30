vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

vim.keymap.set("n", "<leader>_", ":NvimTreeFocus<CR>")
vim.keymap.set("n", "<leader>-", ":NvimTreeToggle<CR>")
