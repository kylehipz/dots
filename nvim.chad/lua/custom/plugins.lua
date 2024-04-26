local plugins = {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "theHamsta/nvim-dap-virtual-text"
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local virtual_text = require("nvim-dap-virtual-text")

      dapui.setup({
        layouts = {
          {
            elements = {
              {
                id = "repl",
                size = 1.0
              }
            },
            position = "bottom",
            size = 15
          }
        },
      })
      virtual_text.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text"
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft="go",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python", "go"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",
        "gopls"
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
    ft = {"*"}
  },
  {
    'nvimdev/lspsaga.nvim',
    ft = {"*"},
    config = function()
        require('lspsaga').setup({})
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons'     -- optional
    }
  },
  {
    "tpope/vim-fugitive",
    ft = {"*"},
  },
  {
    'APZelos/blamer.nvim',
    ft = {"*"}
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-vim-test",
      "nvim-neotest/nvim-nio"
    },
    config = function ()
      require('custom.configs.neotest')
    --   require("neotest").setup({
    --   -- adapters = {
    --   --   require("neotest-python")({
    --   --     runner = "pytest",
    --   --     dap = { justMyCode = false }
    --   --   }),
    --   --   require('neotest-plenary'),
    --   --   require("neotest-vim-test")({
    --   --     ignore_file_types = { "python", "vim", "lua" },
    --   --   }),
    --   -- }
    -- })
    end
  },
  {
    'camgraff/telescope-tmux.nvim'
  }
}

return plugins
