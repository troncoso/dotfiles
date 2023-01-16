local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'sumneko_lua',
	'rust_analyzer'
})

lsp.configure('sumneko_lua', {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})

lsp.configure('rust_analyzer', {
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
		['rust-analyzer'] = {
			checkOnSave = {
				command = 'clippy'
			},
			procMacro = {
				enable = true
			}
		}
	},
	on_attach = function(_, bufnr)
		vim.keymap.set("n", "<Leader>l", "<cmd>:!cargo run<CR>", {
			noremap = true,
			silent = true,
			buffer = bufnr
		})
	end
})

lsp.set_preferences({
	sign_icons = { error = " ", warn = " ", hint = "ﴞ ", info = " " }
})

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-Space>'] = cmp.mapping.complete(),
	['<C-e>'] = cmp.mapping.abort(),
})
-- Disable Tab so it works with copilot
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp', keyword_length = 1 },
		{ name = 'buffer', keyword_length = 1 },
	}
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set('n', '<leader>nd', function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set('n', '<leader>pd', function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
end)

lsp.nvim_workspace()
lsp.setup()
