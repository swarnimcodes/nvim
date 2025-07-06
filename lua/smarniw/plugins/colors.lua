-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
-- }

--  Vague
-- return {
--   "vague2k/vague.nvim",
--   config = function()
--     -- NOTE: you do not need to call setup if you don't want to.
--     require("vague").setup({
--       -- optional configuration here
--     })
--   end,
-- }

-- lua/plugins/rose-pine.lua
-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   config = function()
--     vim.cmd("colorscheme rose-pine")
--   end,
-- }

return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  name = "gruvbox",
  config = function()
    vim.cmd("colorscheme gruvbox")
  end,
}
