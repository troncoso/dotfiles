local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	autotag = { enable = true },
	ensure_installed = {
		"bash",
		"css",
		"dockerfile",
		"html",
		"javascript",
		"json",
		"typescript",
		"yaml",
		"tsx",
		"markdown",
		"gitignore",
		"vim",
		"rust",
	},
	auto_install = true,
})
