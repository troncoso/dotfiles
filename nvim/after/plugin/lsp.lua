local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"sumneko_lua",
	"rust_analyzer",
})

lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lsp.configure("rust_analyzer", {
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
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
			},
			procMacro = {
				enable = true,
			},
		},
	},
	-- Create a keymap to execute cargo run and cargo check
	on_attach = function(_, bufnr)
		local opts = {
			noremap = true,
			silent = true,
			buffer = bufnr,
		}
		vim.keymap.set("n", "<Leader>r", "<cmd>:!cargo run<CR>", opts)
		vim.keymap.set("n", "<Leader>c", "<cmd>:!cargo check<CR>", opts)
	end,
})

lsp.set_preferences({
	sign_icons = { error = " ", warn = " ", hint = "ﴞ ", info = " " },
})

local cmp = require("cmp")
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-Space>"] = cmp.mapping.complete(),
	["<C-e>"] = cmp.mapping.abort(),
})
-- Disable Tab so it works with copilot
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	-- Ensure that LSP suggestions appear before buffer suggestions and snippets
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp", keyword_length = 1 },
		{ name = "buffer", keyword_length = 1 },
	},
})

local lspsaga = require("lspsaga")

-- Customize some of the default keybindings
lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gs", "<cmd>Lspsaga peek_definition<CR>", opts)
	vim.keymap.set("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	vim.keymap.set("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
end)

-- START configure formatting
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local augroup = vim.api.nvim_create_augroup("LspFormatiting", {})

null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.rustfmt,
		diagnostics.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file(".eslintrc.js")
			end,
		}),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
-- END configure formatting

lsp.nvim_workspace()
lsp.setup()
lspsaga.setup({})
