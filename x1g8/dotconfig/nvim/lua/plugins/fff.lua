return {
	{
		"dmtrKovalenko/fff.nvim",
		build = function()
			require("fff.download").download_or_build_binary()
		end,
		opts = {
			preview = {
				enabled = false,
			},
			debug = {
				enabled = true,
				show_scores = true,
			},
		},
		lazy = false,
		keys = {
			{
				"ff",
				function() require("fff").find_files() end,
				desc = "FFFind files",
			},
			{
				"fg",
				function() require("fff").live_grep() end,
				desc = "LiFFFe grep",
			},
			{
				"fc",
				function() require("fff").live_grep({ query = vim.fn.expand("<cword>") }) end,
				desc = "Search current word",
			},
		},
	},
}
