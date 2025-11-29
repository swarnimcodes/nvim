-- Options

-- Relative Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- supposedly prettier experience
vim.opt.termguicolors = true
vim.g.have_nerd_font = true

-- sync system clipboard with vim's keyboard
vim.opt.clipboard = "unnamedplus"

-- persistent undo
vim.opt.undofile = true
-- vim.opt.undodir = -- TODO

-- highlight current line
vim.opt.cursorline = true

-- sensible splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.signcolumn = "yes"

-- Case insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Disable diagnostic signs in the sign column
vim.diagnostic.config({
  signs = false,
  update_in_insert = false,
  -- underline = true, -- Keep underline highlights
  -- virtual_text = false, -- Disable inline text (already handled by Telescope)
})
