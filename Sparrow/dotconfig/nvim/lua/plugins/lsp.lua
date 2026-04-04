return {
	-- Lua development for Neovim (replaces deprecated neodev)
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			-- LSP keymaps via LspAttach autocmd (works regardless of how servers are started)
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach-keymaps", { clear = true }),
				callback = function(event)
					local bufnr = event.buf
					local nmap = function(keys, func, desc)
						if desc then
							desc = "LSP: " .. desc
						end
						vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
					end

					nmap("K", vim.lsp.buf.hover, "Hover Documentation")
					nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
					nmap("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
					nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
					nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
					nmap("gt", vim.lsp.buf.type_definition, "[G]oto [T]ype Definition")
					nmap("gs", vim.lsp.buf.signature_help)
					nmap("<leader>re", vim.lsp.buf.rename)
					nmap("<leader>ca", vim.lsp.buf.code_action)

					-- Create a command `:Format` local to the LSP buffer
					vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
						vim.lsp.buf.format()
					end, { desc = "Format current buffer with LSP" })
				end,
			})

			-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			-- Set shared defaults for all LSP servers
			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			-- Configure individual servers
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			})

			-- Ensure servers are installed via mason
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
			})

			-- Enable servers
			vim.lsp.enable("lua_ls")

			-- Diagnostic configuration
			vim.diagnostic.config({
				virtual_text = false,
			})
		end,
	},
}
