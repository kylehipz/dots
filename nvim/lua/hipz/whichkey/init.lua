local wk = require('which-key')

wk.setup{
  presets = {
    operators = false
  }
}

local mappings = {
  q = {":lua require('telescope.builtin').file_browser({ cwd = '~/quasset/projects'})<cr>", "Quasset Projects"},
  we = {":lua require('telescope.builtin').file_browser({ cwd = '~/projects/go'})<cr>", "Golang Projects"},
  wr = {":lua require('telescope.builtin').file_browser({ cwd = '~/projects/javascript'})<cr>", "Javascript Projects"},
  x = {":bdelete<cr>", "Delete Current Buffer"},
  f = {":NvimTreeToggle<cr>", "File Tree"},
  o = {":Telescope find_files<cr>", "Telescope Find Files"},
  p = {":Telescope git_files<cr>", "Telescope Git Files"},
  l = {":Telescope live_grep<cr>", "Telescope Live Grep"},
  d = {":lua require('telescope.builtin').find_files({ cwd = '~/.config/nvim' })<cr>", "Neovim Config"},
  g = {":LazyGit<cr>", "Lazy Git"}
}

local opts = {
  prefix = '<leader>'
}

wk.register(mappings, opts)