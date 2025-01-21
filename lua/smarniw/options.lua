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
vim.opt.cursorline = false

-- sensible splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.signcolumn = "yes"
