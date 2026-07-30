-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  local clone_output = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })

  if vim.v.shell_error ~= 0 then
    error("Failed to install packer.nvim:\n" .. vim.fn.trim(clone_output))
  end

  vim.cmd.packadd("packer.nvim")
  packer_bootstrap = true
end

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
    branch = 'main'
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

  if packer_bootstrap then
    require("packer").sync()
  end
end)
