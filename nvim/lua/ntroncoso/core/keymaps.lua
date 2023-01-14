vim.g.mapleader = " "

local keymap = vim.keymap
keymap.set("n", "<C-s>", ":w<CR>")
keymap.set("i", "<C-s>", "<ESC>:w<CR>")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "<leader>et", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>")
keymap.set("n", "<leader>fr", ":NvimTreeFocus<CR>")
keymap.set("n", "<leader>g", ":LazyGit<CR>")
-- Move hightlighted lines down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- Move hightlighted lines up
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Highlight the word under the cursor
keymap.set("n", "<C-y>", "viw")
-- Highlight the rest of the line
keymap.set("n", "<C-t>", "v$h")
-- Set backspace to C-d
keymap.set("i", "<C-d>", "<BS>")
-- Go to beginning in insert mode
keymap.set("i", "<C-[>", "<ESC>I")
-- Got to end in insert mode
keymap.set("i", "<C-]>", "<ESC>A")
-- Paste without replacing paste buffer
keymap.set("n", "<leader>p", '"_dP')
keymap.set("v", "<leader>p", '"_dP')

-- perform eslint --fix
keymap.set("n", "<leader>fi", "mF:%!eslint_d --stdin --fix-to-stdout<CR>`F")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>")
keymap.set("n", "<leader>fs", "<cmd>:lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
