vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

  use('nvim-treesitter/nvim-treesitter-context')

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
                                   -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } },
    extensions = {
      fzf = {
        fuzzy = true,                       -- false will only do exact matching
        override_generic_sorter = true,     -- override the generic sorter
        override_file_sorter = true,        -- override the file sorter
        case_mode = "smart_case",
      }
    }
  }

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use 'lewis6991/gitsigns.nvim'

  use 'laytan/cloak.nvim'

  use 'nvim-tree/nvim-web-devicons'

  use 'windwp/nvim-ts-autotag'

  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end
  }

  use 'Mofiqul/dracula.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    options = { theme = 'dracula-nvim' }
  }

  use 'lukas-reineke/indent-blankline.nvim'

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',       -- optional, for file icons
    },
  }

  use {
    'kylechui/nvim-surround',
    tag = '*',     -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require('nvim-surround').setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup()
    end
  }

  use 'ThePrimeagen/harpoon'

  use 'leafgarland/typescript-vim'

  use 'peitalin/vim-jsx-typescript'

  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end
  }

  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  use {
    'andymass/vim-matchup',
    setup = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  }

  use 'mbbill/undotree'
end)
