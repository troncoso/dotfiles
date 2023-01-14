local status, rt = pcall(require, "rust-tools")
if not status then
	return
end

rt.setup({
	tools = {
		runnables = {
			use_telescope = true,
		},
		inlay_hints = {
			auto = true,
			show_parameter_hints = false,
			parameter_hints_prefix = "",
			other_hints_prefix = "",
		},
	},
	server = {
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy",
				},
			},
		},
		on_attach = function(_, bufnr)
			local keymap = vim.keymap
			local opts = { noremap = true, silent = true, buffer = bufnr }
			-- note: these are copied from lspconfig - might want to combine these somehow
			keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
			keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
			keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
			keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
			keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts) -- go to implementation
			keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
			keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
			keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
			keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
			keymap.set("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
			keymap.set("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
			keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
			keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline -- Hover actions
			keymap.set("n", "<Leader>dg", rt.hover_actions.hover_actions, { buffer = bufnr })
			keymap.set("n", "<Leader>dga", rt.code_action_group.code_action_group, { buffer = bufnr })
			keymap.set("n", "<Leader>l", "<cmd>:!cargo run<CR>", opts)
		end,
	},
})
