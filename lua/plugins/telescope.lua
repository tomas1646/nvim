return {
	"nvim-telescope/telescope.nvim",

	tag = "0.1.8",

	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
    local vimgrep_arguments = { unpack(require("telescope.config").values.vimgrep_arguments) }

    -- Search in hidden/dot files.
    table.insert(vimgrep_arguments, "--hidden")
    -- Dont search in the `.git` directory.
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")

		require("telescope").setup({
      defaults = {
        -- `hidden = true` is not supported in text grep commands.
        vimgrep_arguments = vimgrep_arguments,
      },
      pickers = {
        find_files = {
          -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
      },
    })
	end,
}
