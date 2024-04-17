require("neotest").setup({
  adapters = {
    require("neotest-python")({
      runner = "pytest",
      dap = { justMyCode = false }
    }),
    require('neotest-plenary'),
    require("neotest-vim-test")({
      ignore_file_types = { "python", "vim", "lua" },
    }),
  }
})
