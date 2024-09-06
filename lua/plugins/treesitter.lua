return {
	"nvim-treesitter/nvim-treesitter",

	build = ":TSUpdate",

	lazy = false,

	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },

			indent = {
        enable = true,

        disable = { "ruby" }
      },

			sync_install = false,

			auto_install = true,

			ensure_installed = {
				"bash",
				"dockerfile",
				"scss",
				"css",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"lua",
				"typescript",
				"tsx",
				"vim",
				"vimdoc",
				"ruby",
			},
		})
	end,
}
