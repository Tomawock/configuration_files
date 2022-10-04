local vim = vim 
vim.o.number = true
vim.o.relativenumber = true
vim.o.autoindent = true
vim.o.smarttab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.tabstop = 4
-- Colorescheme 
vim.g.tokyonight_style = "night"
vim.cmd 'colorscheme tokyonight'
-- CoQ autostart
vim.g.coq_settings = {
	auto_start = 'shut-up',
	-- need to fix 
	["display.pum.source_context"] = {" \u{231C} ", " \u{231D} "}
}
