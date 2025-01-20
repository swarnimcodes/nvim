return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format" },
      go = { "gofmt" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      json = { "jq" },
      css = { "prettierd" },
      html = { "prettierd" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
