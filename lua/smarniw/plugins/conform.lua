return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      typst = { "typstyle" },
      lua = { "stylua" },
      python = { "ruff_format" },
      go = { "gofmt" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      typescript = { "prettier" },
      json = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      astro = { "prettier" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
