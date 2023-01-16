vim.g.mapleader = " "

-- Some functions to simplify mapping

local function nremap(keymap, command, opts)
	vim.keymap.set("n", keymap, command, opts)
end

local function iremap(keymap, command, opts)
	vim.keymap.set("i", keymap, command, opts)
end

local function vremap(keymap, command, opts)
	vim.keymap.set("v", keymap, command, opts)
end

local function xremap(keymap, command, opts)
	vim.keymap.set("x", keymap, command, opts)
end

--
-- Normal mode remaps
--

-- Open file explorer
nremap("<leader>fe", vim.cmd.Ex)
-- Save file
nremap("<C-s>", ":w<CR>")
-- Delete character without overwriting buffer
nremap("x", '"_x')
-- Move have page down and center screen
nremap("<C-d>", "<C-d>zz")
-- Move have page up and center screen
nremap("<C-u>", "<C-u>zz")
-- Highlight the word under the cursor
nremap("<C-y>", "viw")
-- Highlight the rest of the line
nremap("<C-t>", "v$h")
-- Paste without replacing paste buffer
nremap("<leader>p", '"_dP')
-- Keep screen in middle when jumping to next search result
nremap("n", "nzzzv")
-- Keep screen in middle when jumping to previous search result
nremap("N", "Nzzzv")
-- Prevent accidentally going into Q land
nremap("Q", "<nop>")
-- Find and replace all instances of word under cursor
nremap("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--
-- Insert mode remaps
--

-- Exit insert mode and save file
iremap("<C-s>", "<ESC>:w<CR>")
-- Exit insert mode
iremap("<C-c>", "<ESC>")
-- Set backspace to C-d
iremap("<C-d>", "<BS>")
-- Go to beginning in insert mode
iremap("<C-b>", "<ESC>I")
-- Got to end in insert mode
iremap("<C-e>", "<ESC>A")

--
-- Visual mode remaps
--

-- Exit visual mode and save file
vremap("<C-s>", "<ESC>:w<CR>")
-- Move highlighted lines down
vremap("J", ":m '>+1<CR>gv=gv")
-- Move hightlighted lines up
vremap("K", ":m '<-2<CR>gv=gv")

--
-- Visual and select mode remaps
--

-- Paste without replacing paste buffer
xremap("<leader>p", '"_dP')
-- Keep selecting after indenting
xremap(">", ">gv")
-- Keep selecting after outdenting
xremap("<", "<gv")
