return require('packer').startup(function()
  -- Package manager
  use 'wbthomason/packer.nvim'
  -- Colorscheme
  use 'shaunsingh/nord.nvim'
  use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
  use 'rose-pine/neovim'
  -- Programming
  use {
    'neovim/nvim-lspconfig',
    requires = 'onsails/lspkind-nvim'
  }
  use 'terrortylor/nvim-comment'
  use 'maxmellon/vim-jsx-pretty'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate"
  }
  use {
    'mattn/emmet-vim',
    config = function ()
      vim.g.user_emmet_leader_key = ','

      vim.g.user_emmet_settings = {
        indent_blockelement = 1
      }
    end
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/playground'
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
  use 'jbgutierrez/vim-better-comments'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'lukas-reineke/lsp-format.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  -- Statusline
  use {
    'folke/twilight.nvim'
  }
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
  -- use 'mhinz/vim-signify'
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-rhubarb'
  use 'junegunn/gv.vim'
  -- use 'kdheepak/lazygit.nvim'

end)
