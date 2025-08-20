local plugins = {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "theHamsta/nvim-dap-virtual-text"
    },
    ft = {"*"},
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local virtual_text = require("nvim-dap-virtual-text")

      dapui.setup({
        layouts = {
          {
            elements = {
              {
                id = "scopes",
                size = 1.0
              }
            },
            position = "bottom",
            size = 25
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
      dap_configs = require("custom.configs.dap")
      dap_configs.load_debug_config()
      dap_configs.dap_config()


      require('dap').set_log_level('DEBUG')
      require("core.utils").load_mappings("dap")
    end,
    tag = "0.7.0",
    keys = {
      {
        "<space>da",
        function()
          dap_configs = require("custom.configs.dap")
          dap_configs.load_debug_config()
          require('dap').continue()
        end
      }
    },
    dependencies = {
      {
        "microsoft/vscode-js-debug",
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
      },
      {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
          require('dap-vscode-js').setup({
            debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
            adapters = {"chrome", "pwa-node", "pwa-chrome", "pwa-msedge", "pwa-extensionHost", "node-terminal", "node"}
          })
        end
      },
      {
        "Joakker/lua-json5",
        build = "./install.sh"
      }
    },
    ft={"python", "go", "javascript", "typescript", "php"}
  },
  {
    "mgierada/git-worktree.nvim",
    config = function(_, opts)
      local Worktree = require("git-worktree")

      Worktree.setup({})

      Worktree.on_tree_change(function(op, metadata)
        if op == Worktree.Operations.Switch then
          vim.fn.system("source $(poetry env info --path)/bin/activate")
        end
      end)
    end
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    ft={"python", "go", "javascript", "typescript", "php"}
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
    ft = {"*"},
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

-- Define custom icons for breakpoints
vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })
vim.fn.sign_define('DapBreakpointCondition', {text='🔵', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='⚫', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='💬', texthl='', linehl='', numhl=''})

-- Define custom icon for the current debugging line with a larger arrow
vim.fn.sign_define('DapStopped', {text='➤', texthl='DapStoppedText', linehl='DapStoppedLine', numhl=''})

-- Define highlight groups with colors
vim.cmd [[
    highlight DapStoppedText guifg=#00FF00
    highlight DapStoppedLine guibg=#333333
]]

return plugins
