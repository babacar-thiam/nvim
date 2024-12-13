-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "html", "cssls", "ts_ls", "tailwindcss", "eslint", "gopls",
}

local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring a single lsp: gopls
-- Go
lspconfig.gopls.setup {
  settings = {
    gopls = {
      analyses = {
        unusedparam = true,
        shadow = true,
      },
      staticcheck = true,
      completeUnimported = true,
      usePlaceholders = true,
      experimentalPostfixCompletions = true,
      gofumpt = true,
      codelenses = {
        tidy = true,
        vendor = true,
        upgrade_dependency = true,
      },
    },
  },
}
