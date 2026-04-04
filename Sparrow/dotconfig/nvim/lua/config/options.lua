-- Disable netrw (using oil.nvim instead)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Encoding
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- UI
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

-- Line numbers
vim.opt.number = true
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.smartindent = true

-- Line wrapping
vim.opt.wrap = false

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Files
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Scrolling
vim.opt.scrolloff = 10

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Completion
vim.opt.completeopt = "menuone,noselect"

-- Update time
vim.opt.updatetime = 10
