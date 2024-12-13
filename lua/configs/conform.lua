local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    tsx = { "prettierd" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    --   -- These options will be passed to conform.format()
    timeout_ms = 0,
    lsp_fallback = true,
  },
}

return options
