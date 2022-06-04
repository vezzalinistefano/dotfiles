-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
local function get_config(name)
	return string.format('require("config/%s")', name)
end

-- Auto install packer.nvim
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- File explorer
  use { 
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
  }
  }

  -- Vim git integration
  use 'tpope/vim-fugitive'

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup()
    end
  }

  -- Neovim LSP
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- Colorschemes
  use 'https://gitlab.com/protesilaos/tempus-themes-vim.git'
  use 'glepnir/zephyr-nvim'
  use { "ellisonleao/gruvbox.nvim" }
  use 'RRethy/nvim-base16'

  -- Syntax highlighting
  use 'nvim-treesitter/nvim-treesitter'

  -- Telescope (Fuzzy finder)
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)

