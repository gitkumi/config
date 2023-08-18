vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'lukas-reineke/indent-blankline.nvim',
  'ThePrimeagen/harpoon',
  'mbbill/undotree',
  'tpope/vim-sleuth',
  'kylechui/nvim-surround',
  'norcalli/nvim-colorizer.lua',
  'folke/trouble.nvim',
  'nvim-pack/nvim-spectre',
  'tummetott/unimpaired.nvim',
  'nvim-tree/nvim-web-devicons',
  -- use 'windwp/nvim-ts-autotag'
  -- use 'leafgarland/typescript-vim'
  -- use 'peitalin/vim-jsx-typescript'

  { 'folke/which-key.nvim',  opts = {} },
  { 'numToStr/Comment.nvim', opts = {} },

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'markdown',
        'scss',
        'css',
        'html',
        'help',
        'javascript',
        'tsx',
        'typescript',
        'go',
        'lua',
        'elixir',
        'vim',
        'vimdoc'
      },
      sync_install = false,
      auto_install = true,
      autotag = {
        enable = true,
      },
      swap = {
        enable = true,
        swap_next = {
              ['<leader>s'] = '@parameter.inner',
        },
        swap_previous = {
              ['<leader>S'] = '@parameter.inner',
        },
      },
    }
  },

  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
          { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>gg', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview Hunk' })
      end,
    },
  },

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'auto',
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filename' },
        lualine_c = { 'diagnostics', 'searchcount' },
        lualine_x = { 'encoding', 'diff' },
        lualine_y = { 'branch' },
        lualine_z = { 'filetype' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
      show_end_of_line = true,
      char_highlight_list = {
        "IndentBlanklineIndent",
      },
      -- space_char_blankline = " ",
      space_char_highlight_list = {
        "IndentBlanklineIndent",
      },
    },
  },

  {
    'windwp/nvim-autopairs',
    opts = {
      disable_in_visualblock = true
    }
  },

  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      sort_by = "case_sensitive",
      view = {
        width = 30,
        side = 'right',
        float = {
          enable = true,
          quit_on_focus_loss = true,
          open_win_config = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * 0.6
            local window_h = screen_h * 0.6
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local center_x = (screen_w - window_w) / 2
            local center_y = ((vim.opt.lines:get() - window_h) / 2)
                - vim.opt.cmdheight:get()
            return {
              border = "rounded",
              relative = "editor",
              row = center_y,
              col = center_x,
              width = window_w_int,
              height = window_h_int,
            }
          end,
        },
      },
      renderer = {
        group_empty = true,
        indent_width = 2,
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = "-",
          },
        },
        icons = {
          webdev_colors = true,
          git_placement = "before",
          modified_placement = "after",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = false,
            folder_arrow = true,
            git = true,
            modified = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "",
            modified = "●",
            folder = {
              arrow_closed = "▶",
              arrow_open = "▼",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "~",
              renamed = "➜",
              untracked = "★",
              deleted = "x",
              ignored = "◌",
            },
          },
        },
      },
      git = {
        ignore = false
      },
      filters = {
        dotfiles = false,
      },
      update_focused_file = {
        enable = true,
      },
      actions = {
        open_file = {
          quit_on_open = true
        }
      },
    }
  },
}, {})

vim.cmd.colorscheme [[catppuccin-mocha]]
vim.cmd [[highlight IndentBlanklineIndent guifg=#3D3F49 gui=nocombine]]
vim.cmd [[autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact]]
vim.cmd [[autocmd BufNewFile,BufRead *.mdx set filetype=jsx]]

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.hidden = true
vim.opt.number = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.updatetime = 50

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = 'menuone,noselect'

vim.o.cursorline = true

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- New line
vim.keymap.set("n", "<Enter>", "o<Esc>")

-- Yank like D or C
vim.keymap.set('n', 'Y', 'y$')

-- Move highlighted
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center after moving
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "%", "%zz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")

-- Window navigation
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")

-- Duplicate selected
vim.keymap.set("n", "<leader>d", "<S-v>ypgv")
vim.keymap.set("v", "<leader>d", "ykpgv")

-- Delete without overwriting current buffer
vim.keymap.set({ "n", "v" }, "<leader>x", [["_d]])
vim.keymap.set({ "n", "v" }, "<leader>X", [["_dd]])

-- Paste without overwriting current buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Search current word on cursor
vim.keymap.set("n", "<leader><leader>", '"pyiw?<C-r>"<CR>N')
vim.keymap.set("v", "<leader><leader>", '"py?<C-r>"<CR>N')

-- Replace all
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>]])
vim.keymap.set("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>r", [["zy:%s@<C-r>z@<C-r>z@g<Left><Left>]])
vim.keymap.set("v", "<leader>R", [["zy:%s@<C-r>z@<C-r>z@gI<Left><Left><Left>]])

-- File tree
vim.keymap.set("n", "<leader>b", vim.cmd.NvimTreeToggle)

-- Undo tree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files)
vim.keymap.set('n', '<leader>po', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>pf', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>pr', ":Spectre<CR>")
vim.keymap.set('n', '<leader>ps', require('telescope.builtin').current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>pq', require('telescope.builtin').quickfix)
vim.keymap.set('n', '<leader>pQ', require('telescope.builtin').quickfixhistory)
vim.keymap.set('n', '<leader>ph', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>pm', ":lua require('telescope').extensions.media_files.media_files()<CR>")

-- Harpoon
vim.keymap.set('n', '<leader>a', function()
  require("harpoon.mark").add_file()
end)

vim.keymap.set('n', '<leader><space>', function()
  require("harpoon.ui").toggle_quick_menu()
end)

vim.keymap.set('n', '<leader>1', function()
  require("harpoon.ui").nav_file(1)
end)

vim.keymap.set('n', '<leader>2', function()
  require("harpoon.ui").nav_file(2)
end)

vim.keymap.set('n', '<leader>3', function()
  require("harpoon.ui").nav_file(3)
end)

vim.keymap.set('n', '<leader>4', function()
  require("harpoon.ui").nav_file(4)
end)

vim.keymap.set('n', '<leader>5', function()
  require("harpoon.ui").nav_file(5)
end)

vim.diagnostic.config({
  virtual_text = false
})

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  nmap('ld', vim.lsp.buf.definition)
  nmap('lD', vim.lsp.buf.declaration)
  nmap('li', vim.lsp.buf.implementation)
  nmap('lt', vim.lsp.buf.type_definition)
  nmap('lr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('ls', vim.lsp.buf.signature_help)
  nmap('<leader>f', vim.lsp.buf.format)
  nmap('<F2>', vim.lsp.buf.rename)
  nmap('<F3>', vim.lsp.buf.code_action)

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  -- gopls = {},
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end
}

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
        ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
