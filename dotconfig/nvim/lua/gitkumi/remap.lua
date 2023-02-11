vim.g.mapleader = "\\"
vim.g.maplocalleader = '\\'

-- Go to netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

-- move highlighted
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- New line
vim.keymap.set("n", "<Enter>", "o<Esc>")
vim.keymap.set("n", "<Shift><Enter>", "O<Esc>")

-- Center after nav
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Replace all
vim.keymap.set("n", "<leader>d", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Show documentation/signature
vim.keymap.set("n", "K", function() vim.lsp.buf.signature_help() end)
vim.keymap.set("n", "<C-k>", function() vim.lsp.buf.hover() end)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- File tree
vim.keymap.set('n', '<leader>b', vim.cmd.NvimTreeToggle)
vim.keymap.set('n', '<leader>B', vim.cmd.NvimTreeFocus)
