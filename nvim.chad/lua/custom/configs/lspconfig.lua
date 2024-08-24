local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off"
      },
    },
  }
})


lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", " gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      }
    }
  }
}

lspconfig.dockerls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.yamlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"yaml", "yml"},
})

lspconfig.terraformls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "json",
    "*.tfstate",
  },
})

lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    disableSuggestions = true
  }
})

-- lspconfig.eslint.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })

-- lspconfig.prettier.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })

lspconfig.phpactor.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
