return {
	"zbirenbaum/copilot.lua",

	cmd = "Copilot",

	event = "InsertEnter",

	config = function()
		require("copilot").setup({
			suggestion = {
				enable = true,
				auto_trigger = true,
				keymap = {
					accept = "<Tab>",
				},
			},

			panel = {
				enable = false,
			},
			-- NOTE: Node.js version must be > 18.x
			copilot_node_command = vim.fn.expand("$HOME") .. "/.nvm/versions/node/v22.14.0/bin/node",
		})
	end,
}
