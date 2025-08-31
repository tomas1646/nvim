return {
  "sindrets/diffview.nvim",

  config = function()
    local actions = require("diffview.actions")

    require("diffview").setup({
      view = {
        merge_tool = {
          layout = "diff3_mixed"
        }
      },

      keymaps = {
        view = {
          { "n", "<leader>tt", actions.toggle_files,              { desc = "Toggle the file panel." } },

          { "n", "<leader>cc", actions.conflict_choose("ours"),   { desc = "Choose the Current version of a conflict" } },
          { "n", "<leader>ci", actions.conflict_choose("theirs"), { desc = "Choose the Incoming version of a conflict" } },
        }
      }
    })
  end
}
