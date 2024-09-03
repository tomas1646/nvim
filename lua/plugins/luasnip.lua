return {
	"L3MON4D3/LuaSnip",

	version = "v2.3",

	dependencies = { "rafamadriz/friendly-snippets" },

	config = function()
		local ls = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load({})

		-- Next
		vim.keymap.set({ "i", "s" }, "<C-L>", function()
			ls.jump(1)
		end, { silent = true })
		-- Prev
		vim.keymap.set({ "i", "s" }, "<C-H>", function()
			ls.jump(-1)
		end, { silent = true })
	end,
}
