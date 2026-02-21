-- New line
vim.keymap.set("n", "<Enter>", "o<Esc>")

-- Yank like D or C
vim.keymap.set("n", "Y", "y$")

-- Move highlighted
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center after moving
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "%", "%zz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")

-- Duplicate selected
vim.keymap.set("n", "<leader>d", "<S-v>ykpgv")
vim.keymap.set("v", "<leader>d", "ykpgv")

-- Delete without overwriting current buffer
vim.keymap.set({ "n", "v" }, "<leader>x", [["_d]])
vim.keymap.set({ "n", "v" }, "<leader>X", [["_dd]])

-- Paste without overwriting current buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Replace all
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>]])
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>s", [["zy:%s@<C-r>z@<C-r>z@g<Left><Left>]])
vim.keymap.set("v", "<leader>S", [["zy:%s@<C-r>z@<C-r>z@gI<Left><Left><Left>]])

-- Quickfix
vim.keymap.set("n", "<leader>qx", ":call setqflist([], 'r')<Enter>:close<Enter>", { desc = "Clear Quickfixlist" })
vim.keymap.set("n", "<leader>qo", ":vert copen<Enter>", { desc = "Open Quickfixlist" })
vim.keymap.set("n", "<leader>qc", ":cclose<Enter>", { desc = "Close Quickfixlist" })

-- Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>l", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Copy current file path to clipboard
vim.keymap.set("n", "<leader>cp", function()
	vim.fn.setreg("+", vim.fn.expand("%:p"))
	print("Copied: " .. vim.fn.expand("%:p"))
end, { desc = "Copy current file path to clipboard" })
