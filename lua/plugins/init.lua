return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "go",
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = {
        enable = true,
      },
    },
  },

  -- nvim-ts-autotag
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = {
      "html",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      }
    end,
  },

  -- debugging tools
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
  },
  {
    "nvim-neotest/nvim-nio"
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },

  -- For Go debugging
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end
  },

  {
    "olexsmir/gopher.nvim",
    ft = "go",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap",
    },
    opts = {},
  },

  -- none-ls
  {
    "nvimtools/none-ls.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local null_ls = require "null-ls"
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics

      null_ls.setup {
        -- TypeScript/JavaScript/Angular
        formatting.prettierd,

        -- Go
        formatting.gofmt,
        formatting.goimports_reviser,
        formatting.gofumpt,
        diagnostics.golangci_lint,
      }
    end,
  },
}
