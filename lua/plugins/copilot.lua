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
      copilot_node_command = vim.fn.expand("$HOME") .. "/.local/share/mise/installs/node/24.14.0/bin/node",
    })
  end,
}
