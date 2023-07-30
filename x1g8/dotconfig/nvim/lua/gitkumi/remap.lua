vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Yank like D or C
vim.keymap.set('n', 'Y', 'y$')

-- Move highlighted
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center after moving
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "%", "%zz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")

-- Window navigation
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")

-- Duplicate selected
vim.keymap.set("n", "<leader>d", "<S-v>ypgv")
vim.keymap.set("v", "<leader>d", "ykpgv")

-- Delete without overwriting current buffer
vim.keymap.set({ "n", "v" }, "<leader>x", [["_d]])
vim.keymap.set({ "n", "v" }, "<leader>X", [["_dd]])

-- Paste without overwriting current buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Search current word on cursor
vim.keymap.set("n", "<leader><leader>", '"pyiw?<C-r>"<CR>N')
vim.keymap.set("v", "<leader><leader>", '"py?<C-r>"<CR>N')

-- Replace all
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>]])
vim.keymap.set("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>r", [["zy:%s@<C-r>z@<C-r>z@g<Left><Left>]])
vim.keymap.set("v", "<leader>R", [["zy:%s@<C-r>z@<C-r>z@gI<Left><Left><Left>]])

-- File tree
vim.keymap.set("n", "<leader>b", vim.cmd.NvimTreeToggle)

-- Undo tree 
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Telescope
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.git_files)
vim.keymap.set('n', '<leader>po', builtin.find_files)
vim.keymap.set('n', '<leader>pf', builtin.live_grep)
vim.keymap.set('n', '<leader>pr', ":Spectre<CR>")
vim.keymap.set('n', '<leader>ps', builtin.current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>pq', builtin.quickfix)
vim.keymap.set('n', '<leader>pQ', builtin.quickfixhistory)
vim.keymap.set('n', '<leader>pm', ":lua require('telescope').extensions.media_files.media_files()<CR>")

-- Trouble
vim.keymap.set("n", "<leader>pd", "<cmd>TroubleToggle document_diagnostics<cr>",
  { silent = true, noremap = true }
)

vim.keymap.set("n", "<leader>pD", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  { silent = true, noremap = true }
)

-- Harpoon
vim.keymap.set('n', '<leader>a', function()
  require("harpoon.mark").add_file()
end)

vim.keymap.set('n', '<leader><space>', function()
  require("harpoon.ui").toggle_quick_menu()
end)

vim.keymap.set('n', '<leader>1', function()
  require("harpoon.ui").nav_file(1)
end)

vim.keymap.set('n', '<leader>2', function()
  require("harpoon.ui").nav_file(2)
end)

vim.keymap.set('n', '<leader>3', function()
  require("harpoon.ui").nav_file(3)
end)

vim.keymap.set('n', '<leader>4', function()
  require("harpoon.ui").nav_file(4)
end)

vim.keymap.set('n', '<leader>5', function()
  require("harpoon.ui").nav_file(5)
end)
