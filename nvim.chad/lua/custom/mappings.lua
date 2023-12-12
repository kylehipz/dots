local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"}
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

M.git = {
  n = {
    ["<space>gg"] = {"<cmd> Git<cr>"},
    ["<space>gc"] = {"<cmd> Git commit<cr>"},
    ["<space>gp"] = {"<cmd> Git push<cr>"},
    ["<space>gP"] = {"<cmd> Git pull<cr>"},
  }
}

return M
