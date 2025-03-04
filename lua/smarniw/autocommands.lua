-- AutoCommands
-- Basic: autocmd [Event(s)] [Pattern] [Command]

-- make terminal in vim look nicer
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 75 })
  end,
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
})
