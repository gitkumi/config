vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- New line
vim.keymap.set("n", "<Enter>", "o<Esc>")
vim.keymap.set("n", "<S-Enter>", "O<Esc>")

-- Move highlighted
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center after moving
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "%", "%zz")
vim.keymap.set("n", "#", "#zz")

-- Replace all
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Select block
vim.keymap.set("n", "<leader><S-v>", "0V$%")

-- Duplicate
-- vim.keymap.set("n", "<leader>d", "V%y'>pV$%")
vim.keymap.set("v", "<leader>d", "y'>pV$%")

-- File Tree
vim.keymap.set("n", "<leader>b", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>B", vim.cmd.NvimTreeFocus)

-- Telescope
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pp', builtin.git_files)
vim.keymap.set('n', '<leader>pf', builtin.find_files)
vim.keymap.set('n', '<leader>pd', require('telescope.builtin').diagnostics)
-- Search in project
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>pq', require('telescope.builtin').oldfiles)
vim.keymap.set('n', '<leader>?', require('telescope.builtin').help_tags)
-- Harpoon
vim.keymap.set('n', '<leader>a', function() 
    require("harpoon.mark").add_file()
end)

vim.keymap.set('n', '<leader><space>', function() 
    require("harpoon.ui").toggle_quick_menu()
end)

vim.keymap.set('n', '<leader>n', function() 
    require("harpoon.ui").nav_next()
end)

vim.keymap.set('n', '<leader>p', function() 
    require("harpoon.ui").nav_prev()
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
