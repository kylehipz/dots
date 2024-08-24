local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<space>db"] = {"<cmd> DapToggleBreakpoint <CR>"},
    ["<space>dc"] = {"<cmd> DapContinue <CR>"},
    ["<space>dd"] = {"<cmd> DapStepOver <CR>"},
    ["<space>ds"] = {"<cmd> DapStepInto <CR>"},
    ["<space>df"] = {"<cmd> lua require'dap'.step_back() <CR>"},
    ["<space>do"] = {"<cmd> DapStepOut <CR>"},
    -- ["<space>dt"] = {"<cmd> lua require('neotest').run.run({strategy = 'dap'}) <CR>"},
    ["<space>dT"] = {"<cmd> DapTerminate <CR>"},
    ["<space>dl"] = {"<cmd> lua require('dapui').float_element('scopes', {enter=true}) <CR>"},
    ["<space>dw"] = {"<cmd> lua require('dapui').float_element('watches', {enter=true}) <CR>"},
    ["<space>dp"] = {"<cmd> lua require('dapui').float_element('breakpoints', {enter=true}) <CR>"},
    ["<space>dr"] = {"<cmd> lua require('dapui').float_element('repl', {enter=true}) <CR>"},
    ["<space>dS"] = {"<cmd> lua require('dapui').float_element('stacks', {enter=true}) <CR>"},
    ["<space>dC"] = {"<cmd> lua require('dapui').float_element('console', {enter=true}) <CR>"},
    ["<space>dh"] = {"<cmd> lua require('dapui').float_element('threads', {enter=true}) <CR>"},
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<space>dt"] = {
      function()
        require('neotest').run.run({strategy = 'dap'})
      end
    }
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<space>dt"] = {
      function()
        require('dap-go').debug_test()
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
    ["<space>gj"] = {"<cmd> diffget //2<cr>"},
    ["<space>gk"] = {"<cmd> diffget //3<cr>"},
  }
}

M.neotest = {
  n = {
    ["<space>tt"] = {"<cmd>lua require('neotest').run.run()<cr>"},
    ["<space>tf"] = {"<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>"},
    ["<space>ta"] = {"<cmd>lua require('neotest').run.run(vim.fn.getcwd())<cr>"},
    ["<space>to"] = {"<cmd>lua require('neotest').output.open({ enter = true})<cr>"},
    ["<space>ts"] = {"<cmd>lua require('neotest').summary.toggle()<cr>"},
  }
}

return M
