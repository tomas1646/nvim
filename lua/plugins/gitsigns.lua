return {
	"lewis6991/gitsigns.nvim",

	config = function()
		require("gitsigns").setup({
			signs_staged_enable = true,

			current_line_blame = false,
		})
	end,
}
