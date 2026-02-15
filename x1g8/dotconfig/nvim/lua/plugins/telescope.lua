return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
		},
		config = function()
			require("telescope").setup({
				defaults = {
					layout_strategy = "vertical",
					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-d>"] = false,
							["<C-f>"] = require("telescope.actions").to_fuzzy_refine,
						},
					},
				},
			})

			-- Load fzf extension
			pcall(require("telescope").load_extension, "fzf")
		end,
		keys = {
			{
				"<leader>/",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
						winblend = 10,
						previewer = false,
					}))
				end,
				desc = "Fuzzy find in current buffer",
			},
			{
				"<leader>pq",
				function()
					require("telescope.builtin").quickfix(require("telescope.themes").get_dropdown({
						winblend = 10,
						previewer = false,
					}))
				end,
				desc = "Quickfix list",
			},
			{
				"<leader>pd",
				function()
					require("telescope.builtin").diagnostics(require("telescope.themes").get_dropdown({
						winblend = 10,
						previewer = false,
					}))
				end,
				desc = "Diagnostics",
			},
			{
				"<leader>ps",
				function()
					require("telescope.builtin").lsp_document_symbols(require("telescope.themes").get_dropdown({
						winblend = 10,
						previewer = false,
					}))
				end,
				desc = "LSP document symbols",
			},
			{
				"<leader>z",
				function()
					require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({
						winblend = 10,
						previewer = false,
					}))
				end,
				desc = "Find buffers",
			},
			{
				"<leader>Z",
				function()
					require("telescope.builtin").oldfiles(require("telescope.themes").get_dropdown({
						winblend = 10,
						previewer = false,
					}))
				end,
				desc = "Find recent files",
			},
			{
				"<C-p>",
				function()
					require("telescope.builtin").git_files()
				end,
				desc = "Find git files",
			},
			{
				"<leader>pz",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files",
			},
			{
				"<leader>pf",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live grep",
			},
			{
				"<leader>pw",
				function()
					require("telescope.builtin").grep_string()
				end,
				desc = "Grep string under cursor",
			},
			{
				"<leader>?",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Help tags",
			},
		},
	},
}
