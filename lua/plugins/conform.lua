vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

vim.api.nvim_create_user_command("FormatSync", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = false, lsp_format = "fallback", range = range })
end, { range = true })

local function js_ts_formatters()
  local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

  if cwd == "tech-app" then
    return { "eslint_d" }
  else
    return { "prettier" }
  end
end

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },

  cmd = { "ConformInfo" },

  opts = {
    formatters_by_ft = {
      typescript = js_ts_formatters,
      typescriptreact = js_ts_formatters,
      javascript = js_ts_formatters,
      javascriptreact = js_ts_formatters,
      scss = { "prettier" },
      css = { "prettier" },
      ruby = { "rubocop" },
      json = { "prettier" },
      jsonc = { "prettier" },
    },
  },
}
