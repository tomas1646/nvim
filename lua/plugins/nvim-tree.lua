return {
	"nvim-tree/nvim-tree.lua",

	version = "*",

	lazy = false,

	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("nvim-tree").setup({
			update_focused_file = {
				enable = true,
			},

			filters = {
				git_ignored = false,
				dotfiles = true,
			},

			renderer = {
				indent_width = 1,
				highlight_diagnostics = "all",
				highlight_hidden = "all",
				special_files = {},
			},

			diagnostics = {
				enable = true,

				severity = {
					min = vim.diagnostic.severity.WARN,
					max = vim.diagnostic.severity.ERROR,
				},
			},

			on_attach = function(bufnr)
				local api = require("nvim-tree.api")

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- default mappings
				api.config.mappings.default_on_attach(bufnr)

				-- Telescope find in current folder
				local function telescope_find_files()
					local node = api.tree.get_node_under_cursor()
					local abs_path = node.absolute_path
					local escaped_path = vim.fn.shellescape(abs_path)
					vim.cmd("Telescope find_files search_dirs={" .. escaped_path .. "}")
				end
				vim.keymap.set("n", "tf", telescope_find_files, opts("Find files in current directory"))

				-- Telescope grep in current file
				local function telescope_live_grep()
					local node = api.tree.get_node_under_cursor()
					local abs_path = node.absolute_path
					local escaped_path = vim.fn.shellescape(abs_path)
					vim.cmd("Telescope live_grep search_dirs={" .. escaped_path .. "}")
				end
				vim.keymap.set("n", "tg", telescope_live_grep, opts("Grep in current directory"))
			end,
		})
	end,
}
