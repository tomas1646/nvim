return {
  -- Autocomplete
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      local cmp = require("cmp")
      local lsp_kind = require("lspkind")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-o>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "luasnip" },
        }),

        formatting = {
          format = lsp_kind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
          }),
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig", -- Nvim LSP client config
    lazy = false,
    config = function()
      -- Capabilites -> "Useful for broadcasting to the server additional functionality (snippets, off-protocol features) provided by plugins."
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Typescript / Javascript
      vim.lsp.config('ts_ls', {
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },

        init_options = {
          hostInfo = "neovim",
        },

        capabilities = capabilities,
      })
      vim.lsp.enable('ts_ls')

      -- eslint
      vim.lsp.config('eslint', {
        capabilities = capabilities
      })
      vim.lsp.enable('eslint')

      -- Ruby-LSP
      vim.lsp.config('ruby_lsp', {
        filetypes = { "ruby" },

        capabilities = capabilities,

        cmd = { "/home/tomas1646/.rbenv/shims/ruby-lsp" },
      })
      vim.lsp.enable('ruby_lsp')

      -- CSS
      vim.lsp.config('cssls', {
        filetypes = { "css", "scss", "less" },

        capabilities = capabilities,
      })
      vim.lsp.enable('cssls')

      -- Lua
      vim.lsp.config('lua_ls', {
        filetypes = { "lua" },
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
        capabilities = capabilities,
      })
      vim.lsp.enable('lua_ls')

      -- C & C++ | Clangd
      vim.lsp.config('clangd', {
        filetypes = { "c", "cpp" },

        capabilities = capabilities,
      })
      vim.lsp.enable('clangd')

      -- Dockerfile
      vim.lsp.config('dockerls', {})
      vim.lsp.enable('dockerls')
    end,
  },
}
