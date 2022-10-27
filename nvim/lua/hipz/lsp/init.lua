require'lspconfig'.gopls.setup{}
-- require'lspconfig'.tsserver.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.terraformls.setup{}
require'lspconfig'.clangd.setup{}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.cssls.setup{
  capabilities = capabilities
}

-- Lua lsp config
local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end
local sumneko_root_path = '/home/kyle/projects/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
--

local map = vim.api.nvim_set_keymap
map('n', 'gd', ':lua vim.lsp.buf.definition()<cr>', {noremap = true, silent = true})
map('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>', {noremap = true, silent = true})
map('n', 'gr', ':Telescope lsp_references<cr>', {noremap = true, silent = true})
-- map('n', 'gr', ':lua vim.lsp.buf.references()<cr>', {noremap = true, silent = true})
map('n', 'gi', ':lua vim.lsp.buf.implementation()<cr>', {noremap = true, silent = true})
map('n', 'K', ':lua vim.lsp.buf.hover()<cr>', {noremap = true, silent = true})
map('n', '<C-k>', ':lua vim.lsp.buf.signature_help()<cr>', {noremap = true, silent = true})
map('n', '<C-P>', ':lua vim.diagnostic.goto_next()<cr>', {noremap = true, silent = true})
map('n', '<C-]>', ':lua vim.diagnostic.goto_prev()<cr>', {noremap = true, silent = true})

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- terraform
-- autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync(nil, 100)
-- autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
-- vim.cmd[[
--   autocmd BufWritePre *.js lua vim.lsp.buf.formatting_seq_sync(nil, 100)
-- ]]
-- autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
