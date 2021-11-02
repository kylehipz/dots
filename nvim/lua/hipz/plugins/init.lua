return require('packer').startup(function()
  -- Package manager
  use 'wbthomason/packer.nvim'
  -- Colorscheme
  use 'shaunsingh/nord.nvim'
  use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
  -- Programming
  use {
    'neovim/nvim-lspconfig',
    requires = 'onsails/lspkind-nvim'
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate"
  }
  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-autopairs'
  use 'p00f/nvim-ts-rainbow'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},                                 
      {'nvim-lua/plenary.nvim'},                               
      {'nvim-telescope/telescope-fzy-native.nvim', run="make"},
      {'nvim-telescope/telescope-symbols.nvim'}
    }
  }
  use 'rcarriga/nvim-notify'
  -- Key bindings
  use 'folke/which-key.nvim'
  use 'voldikss/vim-floaterm'
  -- Git
  use 'tpope/vim-fugitive'
  use 'mhinz/vim-signify'
  use 'tpope/vim-rhubarb'
  use 'junegunn/gv.vim'
  use 'kdheepak/lazygit.nvim'

end)