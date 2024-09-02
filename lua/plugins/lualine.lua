return {
	"nvim-lualine/lualine.nvim",

	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("lualine").setup({
			options = {
				theme = "iceberg_dark",

				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "filename" },
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = "E", warn = "W", info = "I", hint = "H" },
						colored = true,
						always_visible = false,
					},
				},
				lualine_y = { "fileformat", "filetype" },
				lualine_z = { "location" },
			},
		})
	end,
}
