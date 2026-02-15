return {
	-- Oil file explorer
	{
		"stevearc/oil.nvim",
		opts = {
			use_default_keymaps = false,
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-s>"] = "actions.select_vsplit",
				["<C-h>"] = "actions.select_split",
				["<C-l>"] = "actions.refresh",
				["<Tab>"] = "actions.preview",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
			},
			view_options = {
				show_hidden = true,
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<leader><space>",
				function()
					require("oil").open()
				end,
				desc = "Open Oil file explorer",
			},
		},
	},

	-- Harpoon
	{
		"ThePrimeagen/harpoon",
		keys = {
			{
				"<leader>a",
				function()
					require("harpoon.mark").add_file()
				end,
				desc = "Harpoon: Add file",
			},
			{
				"<leader>h",
				function()
					require("harpoon.ui").toggle_quick_menu()
				end,
				desc = "Harpoon: Toggle menu",
			},
			{
				"<leader>1",
				function()
					require("harpoon.ui").nav_file(1)
				end,
				desc = "Harpoon: Nav file 1",
			},
			{
				"<leader>2",
				function()
					require("harpoon.ui").nav_file(2)
				end,
				desc = "Harpoon: Nav file 2",
			},
			{
				"<leader>3",
				function()
					require("harpoon.ui").nav_file(3)
				end,
				desc = "Harpoon: Nav file 3",
			},
			{
				"<leader>4",
				function()
					require("harpoon.ui").nav_file(4)
				end,
				desc = "Harpoon: Nav file 4",
			},
			{
				"<leader>5",
				function()
					require("harpoon.ui").nav_file(5)
				end,
				desc = "Harpoon: Nav file 5",
			},
		},
	},
}
