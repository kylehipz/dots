-- require'lsp-format'.setup {
--   html = {{cmd = {"prettier -w"}}},
--   javascript = {{cmd = {"standard --fix ."}}}
-- }
--
local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

-- null_ls.setup({
--   debug = false,
-- })
-- vim.cmd('autocmd BufWritePost *.js lua vim.lsp.buf.formatting_seq_sync()')

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
    -- you can reuse a shared lspconfig on_attach callback here
    debug = false,
    sources = {
      formatting.standardjs,
      diagnostics.standardjs
      -- formatting.prettier,
      -- diagnostics.eslint,
      -- code_actions.eslint
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.format()
                end,
            })
        end
    end,
})
