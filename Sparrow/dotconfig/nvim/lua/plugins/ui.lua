return {
	-- Lualine statusline
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = false,
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {},
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 1,
					},
				},
				lualine_x = { "encoding", "fileformat" },
				lualine_y = { "filetype" },
				lualine_z = { "branch", "diff", "diagnostics" },
			},
		},
	},

	-- Indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "┊",
			},
			scope = { enabled = false },
		},
	},

	-- Better UI components
	{
		"stevearc/dressing.nvim",
		opts = {},
	},

	-- Snacks.nvim
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			quickfile = { enabled = true },
			words = { enabled = true },
			notifier = { enabled = true },
		},
	},

	-- Icons
	"nvim-tree/nvim-web-devicons",

	-- Colorizer
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
}
