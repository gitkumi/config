local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

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

  'tpope/vim-sleuth',
  'tpope/vim-fugitive',
  'RRethy/vim-illuminate',
  'ThePrimeagen/harpoon',
  'mbbill/undotree',
  'nvim-tree/nvim-web-devicons',
  'leafgarland/typescript-vim',
  'peitalin/vim-jsx-typescript',

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme 'tokyonight-moon'
    end,
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {},
        lualine_c = {
          {
            'filename',
            file_status = true,
            path = 1
          }
        },
        lualine_x = { 'encoding', 'fileformat' },
        lualine_y = { 'filetype' },
        lualine_z = { 'branch', 'diff', 'diagnostics' },
      }
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = '┊',
      },
      scope = { enabled = false },
    }
  },

  { 'numToStr/Comment.nvim', opts = {} },

  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  {
    'stevearc/dressing.nvim',
    opts = {},
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },

  {
    "ggandor/leap.nvim",
    config = function()
      require('leap').create_default_mappings()
    end
  },

  {
    'stevearc/oil.nvim',
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
        show_hidden = true
      }
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- {
  --   'nvim-tree/nvim-tree.lua',
  --   opts = {
  --     sort_by = "case_sensitive",
  --     view = {
  --       width = 30,
  --       side = 'right',
  --       float = {
  --         enable = true,
  --         quit_on_focus_loss = true,
  --         open_win_config = function()
  --           local screen_w = vim.opt.columns:get()
  --           local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
  --           local window_w = screen_w * 0.6
  --           local window_h = screen_h * 0.6
  --           local window_w_int = math.floor(window_w)
  --           local window_h_int = math.floor(window_h)
  --           local center_x = (screen_w - window_w) / 2
  --           local center_y = ((vim.opt.lines:get() - window_h) / 2)
  --               - vim.opt.cmdheight:get()
  --           return {
  --             border = "rounded",
  --             relative = "editor",
  --             row = center_y,
  --             col = center_x,
  --             width = window_w_int,
  --             height = window_h_int,
  --           }
  --         end,
  --       },
  --     },
  --     renderer = {
  --       group_empty = false,
  --       indent_width = 2,
  --       indent_markers = {
  --         enable = true,
  --         inline_arrows = true,
  --         icons = {
  --           corner = "└",
  --           edge = "│",
  --           item = "│",
  --           bottom = "─",
  --           none = "-",
  --         },
  --       },
  --       icons = {
  --         webdev_colors = true,
  --         git_placement = "before",
  --         modified_placement = "after",
  --         padding = " ",
  --         symlink_arrow = " ➛ ",
  --         show = {
  --           file = true,
  --           folder = false,
  --           folder_arrow = true,
  --           git = true,
  --           modified = true,
  --         },
  --         glyphs = {
  --           default = "",
  --           symlink = "",
  --           bookmark = "",
  --           modified = "●",
  --           folder = {
  --             arrow_closed = "▶",
  --             arrow_open = "▼",
  --             default = "",
  --             open = "",
  --             empty = "",
  --             empty_open = "",
  --             symlink = "",
  --             symlink_open = "",
  --           },
  --           git = {
  --             unstaged = "✗",
  --             staged = "✓",
  --             unmerged = "~",
  --             renamed = "➜",
  --             untracked = "★",
  --             deleted = "x",
  --             ignored = "◌",
  --           },
  --         },
  --       },
  --     },
  --     git = {
  --       ignore = false
  --     },
  --     filters = {
  --       dotfiles = false,
  --     },
  --     update_focused_file = {
  --       enable = true,
  --     },
  --     actions = {
  --       open_file = {
  --         quit_on_open = true
  --       }
  --     },
  --   }
  -- },

  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  },

  {
    'tummetott/unimpaired.nvim',
    config = function()
      require('unimpaired').setup({
      })
    end
  },

  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup({
        filetypes = { "html", "xml" },
      })
    end
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({
        disable_in_visualblock = true,
        disable_in_macro = true
      })
    end
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  {
    'eandrju/cellular-automaton.nvim'
  },
}, {})

vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.showmode = false

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
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

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

require('telescope').setup {
  defaults = {
    layout_strategy = 'vertical',
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

pcall(require('telescope').load_extension, 'fzf')

vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end)

vim.keymap.set('n', '<leader>pq', function()
  require('telescope.builtin').quickfix(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end)

vim.keymap.set('n', '<leader>pd', function()
  require('telescope.builtin').diagnostics(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end)

vim.keymap.set('n', '<leader>ps', function()
  require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end)

vim.keymap.set('n', '<leader>z', function()
  require('telescope.builtin').buffers(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end)

vim.keymap.set('n', '<leader>Z', function()
  require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end)

vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files)
vim.keymap.set('n', '<leader>pz', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>pf', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>pw', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>pq', require('telescope.builtin').lsp_references)
vim.keymap.set('n', '<leader>?', require('telescope.builtin').help_tags)

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = {
    'go',
    'bash',
    'lua',
    'vimdoc',
    'vim',
    'markdown',
    'scss',
    'css',
    'html',
    'javascript',
    'typescript',
    'tsx',
    'elixir',
    'heex',
    'templ',
    'sql'
  },
  auto_install = false,
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>sw'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>Sw'] = '@parameter.inner',
      },
    },
  },
}

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('gt', vim.lsp.buf.type_definition, '[G]oto [T]ype Definition')
  nmap('gr', vim.lsp.buf.references)
  nmap('gs', vim.lsp.buf.signature_help)
  nmap('<leader>f', vim.lsp.buf.format)
  nmap('<leader>re', vim.lsp.buf.rename)
  nmap('<leader>ca', vim.lsp.buf.code_action)

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
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
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

vim.diagnostic.config({
  virtual_text = false
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
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "%", "%zz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- No need to press shift key
vim.keymap.set("n", "]", "}")
vim.keymap.set("n", "[", "{")

-- Window navigation
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")

-- Duplicate selected
vim.keymap.set("n", "<leader>d", "<S-v>ykpgv")
vim.keymap.set("v", "<leader>d", "ykpgv")

-- Delete without overwriting current buffer
vim.keymap.set({ "n", "v" }, "<leader>x", [["_d]])
vim.keymap.set({ "n", "v" }, "<leader>X", [["_dd]])

-- Paste without overwriting current buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Replace all
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>]])
vim.keymap.set("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>r", [["zy:%s@<C-r>z@<C-r>z@g<Left><Left>]])
vim.keymap.set("v", "<leader>R", [["zy:%s@<C-r>z@<C-r>z@gI<Left><Left><Left>]])

-- File tree
-- vim.keymap.set("n", "<leader>b", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader><space>", function()
  require("oil").open()
end)

-- Undo tree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Quickfix
vim.keymap.set('n', '<leader>qx', ":call setqflist([], 'r')<Enter>:close<Enter>", { desc = 'Clear Quickfixlist' })
vim.keymap.set('n', '<leader>qo', ":copen<Enter>", { desc = 'Open Quickfixlist' })
vim.keymap.set('n', '<leader>qc', ":cclose<Enter>", { desc = 'Close Quickfixlist' })

-- Diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>l', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set("n", "<leader>tx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>tw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>td", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>tq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>tl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

vim.keymap.set('n', '<leader>`', ':vs | :term<Enter>a')

-- Harpoon
vim.keymap.set('n', '<leader>a', function()
  require("harpoon.mark").add_file()
end)

vim.keymap.set('n', '<leader>h', function()
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

vim.keymap.set('n', '<leader>dq', ':diffget //2<Enter>]c')
vim.keymap.set('n', '<leader>dp', ':diffget //3<Enter>]c')

vim.keymap.set("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<CR>")
vim.keymap.set("n", "<leader>mir", "<cmd>CellularAutomaton make_it_rain<CR>")

vim.filetype.add({
  extension = {
    templ = "templ",
  },
})

vim.cmd [[autocmd BufNewFile,BufRead *.mdx set filetype=jsx]]
vim.cmd [[autocmd BufNewFile,BufRead *Jenskinsfile* set filetype=groovy]]

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
