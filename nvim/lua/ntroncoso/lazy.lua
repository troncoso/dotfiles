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

require('lazy').setup({
	-- Themes
	{ 'rose-pine/neovim', as = 'rose-pine' },
	{ 'folke/tokyonight.nvim', as = 'tokyonight' },
	{ 'navarasu/onedark.nvim', as = 'onedark' },
	{ 'navarasu/onedark.nvim', as = 'onedark' },
	{ 'EdenEast/nightfox.nvim', as = 'nightfox' },
	{ 'nyoom-engineering/oxocarbon.nvim', as = 'carbonfox' },

	-- Needed by telescope
	'nvim-lua/plenary.nvim',
	-- Grep search for telescope
	'nvim-telescope/telescope-live-grep-args.nvim',
	-- Fuzzy finder
	{ 'nvim-telescope/telescope.nvim' },
	-- Advanced syntax highlighting
	{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
	-- Undo UI
	'mbbill/undotree',
	-- Git UI
	'kdheepak/lazygit.nvim',
	-- Auto close some characters
	'windwp/nvim-autopairs',
	-- Add status bar
	'nvim-lualine/lualine.nvim',
	-- Git decorations
	'lewis6991/gitsigns.nvim',
	-- Add icons for autocomplete menu
	'onsails/lspkind.nvim',
	-- Auto close html tags and keep opening/closing tag name in sync
	'windwp/nvim-autopairs',
	-- Shortcuts for commenting/uncommenting
	'numToStr/Comment.nvim',
	 -- Copilot
	'github/copilot.vim',
	-- Modify netrw
	'tpope/vim-vinegar',

	-- START LSP-ZERO --

	-- Icons for lsp column
	'nvim-tree/nvim-web-devicons',

	-- LSP Support
	'neovim/nvim-lspconfig',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',

	-- Autocompletion
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'saadparwaiz1/cmp_luasnip',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-nvim-lua',

	-- Snippets
	'L3MON4D3/LuaSnip',
	-- Snippet collection (Optional)
	'rafamadriz/friendly-snippets',

	'VonHeikemen/lsp-zero.nvim',

	-- END LSP-ZERO --
})


-- Setup for plugins that don't need special configuration
require('Comment').setup()
require('gitsigns').setup()
require('nvim-autopairs').setup()
