-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Open quickfix list vertically
local qf_group = vim.api.nvim_create_augroup("VerticalQuickfix", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = qf_group,
	pattern = "qf",
	callback = function()
		vim.cmd("wincmd L")
	end,
})

-- Filetype autocmds
vim.cmd([[autocmd BufNewFile,BufRead *.mdx set filetype=jsx]])
vim.cmd([[autocmd BufNewFile,BufRead *Jenskinsfile* set filetype=groovy]])
