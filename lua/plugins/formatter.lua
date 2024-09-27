local function prettier()
	return {
		exe = "prettier",
		args = {
			"--config-precedence",
			"prefer-file",
			"--stdin-filepath",
			vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
		},
		stdin = true,
	}
end

return {
	"mhartington/formatter.nvim",

	config = function()
		require("formatter").setup({
			logging = false,

			filetype = {
				javascript = { prettier },
				javascriptreact = { prettier },
				typescript = { prettier },
				typescriptreact = { prettier },
        scss = { prettier },
				css = { prettier },
				lua = {
					function()
						return {
							exe = "stylua",
							args = {
								"-",
							},
							stdin = true,
						}
					end,
				},
			},
		})
	end,
}
