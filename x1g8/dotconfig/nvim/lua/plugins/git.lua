return {
	-- Git conflict resolution
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = function()
			require("git-conflict").setup({
				default_mappings = false,
			})
		end,
		keys = {
			{ "<leader>co", ":GitConflictListQf<Enter>", desc = "List conflicts in quickfix" },
			{
				"co",
				":GitConflictChooseOurs<Enter>:GitConflictNextConflict<Enter>",
				desc = "Choose ours & next conflict",
			},
			{
				"ct",
				":GitConflictChooseTheirs<Enter>:GitConflictNextConflict<Enter>",
				desc = "Choose theirs & next conflict",
			},
			{
				"cb",
				":GitConflictChooseBoth<Enter>:GitConflictNextConflict<Enter>",
				desc = "Choose both & next conflict",
			},
			{
				"c0",
				":GitConflictChooseNone<Enter>:GitConflictNextConflict<Enter>",
				desc = "Choose none & next conflict",
			},
			{ "]c", ":GitConflictNextConflict<Enter>", desc = "Next conflict" },
			{ "[c", ":GitConflictPrevConflict<Enter>", desc = "Previous conflict" },
		},
	},

	-- Gitsigns
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged_enable = true,
			signcolumn = true,
			numhl = false,
			linehl = false,
			word_diff = false,
			watch_gitdir = {
				follow_files = true,
			},
			auto_attach = true,
			attach_to_untracked = false,
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol",
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
				use_focus = true,
			},
			current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil,
			max_file_length = 40000,
			preview_config = {
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
		},
	},

	-- Fugitive
	"tpope/vim-fugitive",

	-- Git blame
	{
		"FabijanZulj/blame.nvim",
		lazy = false,
		config = function()
			require("blame").setup({})
		end,
		keys = {
			{ "<leader>gb", ":BlameToggle virtual<Enter>", desc = "Toggle Git Blame" },
		},
	},
}
