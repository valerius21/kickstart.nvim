return {
  {
    'neovim/nvim-lspconfig',
    ft = 'go',
    opts = function(_, opts)
      opts.sources = vim.list_extend(opts.sources or {}, {
        servers = {
          gopls = {
            settings = {
              gopls = {
                gofumpt = true,
                codelenses = {
                  gc_details = false,
                  generate = true,
                  regenerate_cgo = true,
                  run_govulncheck = true,
                  test = true,
                  tidy = true,
                  upgrade_dependency = true,
                  vendor = true,
                },
                hints = {
                  assignVariableTypes = true,
                  compositeLiteralFields = true,
                  compositeLiteralTypes = true,
                  constantValues = true,
                  functionTypeParameters = true,
                  parameterNames = true,
                  rangeVariableTypes = true,
                },
                analyses = {
                  fieldalignment = true,
                  nilness = true,
                  unusedparams = true,
                  unusedwrite = true,
                  useany = true,
                },
                usePlaceholders = true,
                completeUnimported = true,
                staticcheck = true,
                directoryFilters = { '-.git', '-.vscode', '-.idea', '-.vscode-test', '-node_modules' },
                semanticTokens = true,
              },
            },
          },
        },
      })
    end,
  },
  {
    'nvimtools/none-ls.nvim',
    ft = 'go',
    dependencies = {
      {
        'williamboman/mason.nvim',
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { 'gomodifytags', 'impl' })
        end,
      },
    },
    opts = function(_, opts)
      local nls = require 'null-ls'
      -- local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.code_actions.gomodifytags,
        nls.builtins.code_actions.impl,
        -- NOTE: conform is handling the formatting
      })
    end,
  },
  {
    'leoluz/nvim-dap-go',
    config = true,
  },
  {
    'mfussenegger/nvim-dap',
    optional = true,
    dependencies = {
      {
        'williamboman/mason.nvim',
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { 'delve' })
        end,
      },
      {
        'leoluz/nvim-dap-go',
        config = true,
      },
    },
  },
}
