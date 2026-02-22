-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Filetype autocmds
vim.cmd([[autocmd BufNewFile,BufRead *.mdx set filetype=jsx]])
vim.cmd([[autocmd BufNewFile,BufRead *Jenskinsfile* set filetype=groovy]])
