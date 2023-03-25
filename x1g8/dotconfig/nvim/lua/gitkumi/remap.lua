vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- New line
vim.keymap.set("n", "<Enter>", "o<Esc>")

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

-- Make . work with visually selected lines
-- vim.keymap.set("v", ".", ":normal.<CR>")

-- Delete without overwriting current buffer
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Paste without overwriting current buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- disable Q (same as pressing :)
vim.keymap.set("n", "Q", "<nop>")

-- Replace all
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- File Tree
vim.keymap.set("n", "<leader>b", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>B", vim.cmd.NvimTreeFocus)

-- Telescope
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>po', builtin.find_files)
vim.keymap.set('n', '<leader>pp', builtin.git_files)
vim.keymap.set('n', '<leader>ps', builtin.live_grep)
vim.keymap.set('n', '<leader>pq', builtin.grep_string)
vim.keymap.set('n', '<leader>pw', builtin.lsp_references)
vim.keymap.set('n', '<leader>?', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>pr', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
-- diagnostics (trouble.nvim)
vim.keymap.set("n", "<leader>pd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>pD", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)

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

vim.keymap.set('n', '<leader>5', function() 
    require("harpoon.ui").nav_file(5)
end)
