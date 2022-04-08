require'format'.setup {
  html = {{cmd = {"prettier -w"}}},
  javascript = {{cmd = {"standard --fix ."}}}
}

vim.cmd('autocmd BufWritePost * FormatWrite')
