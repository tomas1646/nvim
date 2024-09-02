vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

opt.number = true
opt.relativenumber = true

opt.scrolloff = 8

opt.cursorline = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

-- System clipboard
vim.g.clipboard = {
	name = "xclip",
	copy = {
		["+"] = "xclip -selection clipboard",
		["*"] = "xclip -selection clipboard",
	},
	paste = {
		["+"] = "xclip -out -selection clipboard",
		["*"] = "xclip -out -selection clipboard",
	},
}