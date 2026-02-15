return {
	-- Comment.nvim
	{ "numToStr/Comment.nvim", opts = {} },

	-- Auto pairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				disable_in_visualblock = true,
				disable_in_macro = true,
			})
		end,
	},

	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	-- Unimpaired
	{
		"tummetott/unimpaired.nvim",
		config = function()
			require("unimpaired").setup({})
		end,
	},

	-- Cellular automaton
	{
		"eandrju/cellular-automaton.nvim",
		keys = {
			{ "<leader>gol", "<cmd>CellularAutomaton game_of_life<CR>", desc = "Game of Life" },
			{ "<leader>mir", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Make it Rain" },
		},
	},

	-- TypeScript support
	"leafgarland/typescript-vim",
	"peitalin/vim-jsx-typescript",
}
