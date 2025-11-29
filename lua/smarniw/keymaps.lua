-- Keymaps

-- open diagnostic floating window
-- vim.keymap.set("n", "<leader>lk", function()
--   vim.diagnostic.open_float()
-- end, { desc = "Show diagnostic in a floating window" })

-- Oil: file based operations as a vim buffer
vim.keymap.set("n", "-", "<Cmd>Oil<CR>")

-- Exit terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Clear search highlights
vim.keymap.set("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- next and prev in quickfix list
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

-- split navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus on left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus on below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus on above window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus on right window" })
-- window resize (respecting `v:count`)
vim.keymap.set(
  "n",
  "<C-Left>",
  '"<Cmd>vertical resize -" . v:count1 . "<CR>"',
  { expr = true, replace_keycodes = false, desc = "Decrease window width" }
)
vim.keymap.set(
  "n",
  "<C-Down>",
  '"<Cmd>resize -" . v:count1 . "<CR>"',
  { expr = true, replace_keycodes = false, desc = "Decrease window height" }
)
vim.keymap.set(
  "n",
  "<C-Up>",
  '"<Cmd>resize +" v:count1 . "<CR>"',
  { expr = true, replace_keycodes = false, desc = "Increase window height" }
)
vim.keymap.set(
  "n",
  "<C-Right>",
  '"<Cmd>vertical resize +" . v:count1 . "<CR>"',
  { expr = true, replace_keycodes = false, desc = "Increase window width" }
)
