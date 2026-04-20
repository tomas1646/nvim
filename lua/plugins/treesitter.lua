return {
  "nvim-treesitter/nvim-treesitter",

  branch = 'main',

  build = ":TSUpdate",

  lazy = false,

  config = function()
    local languages = {
      "astro", "bash", "dockerfile", "scss", "css", "html",
      "javascript", "jsdoc", "json", "lua", "typescript",
      "tsx", "vim", "vimdoc", "ruby"
    }

    require("nvim-treesitter").install(languages)
  end,
}
