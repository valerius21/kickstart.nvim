local file_types = {
  'javascript',
  'javascriptreact',
  'json',
  'typescript',
  'typescriptreact',
}

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

return {
  -- NOTE: LSP config managed by init.lua
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    ft = file_types,
    opts = {
      settings = {
        code_lens = 'all',
        expose_as_code_action = { 'fix_all', 'add_missing_imports', 'remove_unused', 'remove_unused_imports' },
      },
    },
  },
  {
    'windwp/nvim-ts-autotag',
    ft = file_types,
    opts = {},
  },
  {
    'williamboman/mason.nvim',
    ft = file_types,
    opts = {
      ensure_installed = {
        'biome',
        'typescript-language-server',
        'tailwindcss-language-server',
      },
    },
  },
  {
    'nvimtools/none-ls.nvim',
    event = 'VeryLazy',
    ft = file_types,
    opts = function()
      local null_ls = require 'null-ls'
      local opts = {
        sources = {
          -- Typscript with React
          null_ls.builtins.formatting.biome.with {
            args = {
              'check',
              '--apply-unsafe',
              '--stdin-file-path=$FILENAME',
            },
          },
        },
        on_attach = function(client, bufnr)
          if client.supports_method 'textDocument/formatting' then
            vim.api.nvim_clear_autocmds {
              group = augroup,
              buffer = bufnr,
            }
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format { bufnr = bufnr }
              end,
            })
          end
        end,
      }
      return opts
    end,
  },
}
