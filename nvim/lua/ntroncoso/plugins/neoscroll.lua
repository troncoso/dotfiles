local setup, neoscroll = pcall(require, "neoscroll")
if not setup then
	return
end

neoscroll.setup({
	easing_function = "circular",
	mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-e>", "zt", "zz", "zb" },
})
