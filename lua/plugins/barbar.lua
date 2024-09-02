return {
	"romgrk/barbar.nvim",

	init = function()
		vim.g.barbar_auto_setup = false
	end,

	opts = {
		amimation = false,

		focus_on_close = "previous",

		icons = {
			buffer_index = true,
			diagnostics = {
				[vim.diagnostic.severity.ERROR] = { enabled = true },
				[vim.diagnostic.severity.WARN] = { enabled = true },
				[vim.diagnostic.severity.INFO] = { enabled = false },
				[vim.diagnostic.severity.HINT] = { enabled = false },
			},
		},

		sidebar_filetypes = {
			NvimTree = true,
		},

		maximum_padding = 1,
		minimum_padding = 1,
	},
}
