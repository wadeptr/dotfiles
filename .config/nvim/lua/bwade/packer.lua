-- This file can be loaded by calling `lua require('plugins')` from your init.vim


return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    }
  }

  use {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000
  }

  -- use 'ellisonleao/gruvbox.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    run = ':TSUpdate'
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
    }
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    }
  }

  use 'nvim-lua/plenary.nvim'
  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { { "nvim-lua/plenary.nvim" } }
  }

  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use {
    'NeogitOrg/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    }
  }

  use 'neovim/nvim-lspconfig'

  use {
    'pmizio/typescript-tools.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' }
  }

  use 'stevearc/conform.nvim'
  use 'mfussenegger/nvim-lint'
  use 'windwp/nvim-ts-autotag'

  use {
    'saghen/blink.cmp',
    tag = 'v1.10.2',

    -- optional, snippet collection
    requires = {
      'rafamadriz/friendly-snippets',
    },

    -- builds Rust fuzzy matcher
    run = 'cargo build --release',
  }
end)
