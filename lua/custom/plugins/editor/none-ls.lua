return {
  {
    'nvimtools/none-ls.nvim',
    ft = { 'go', 'typescript', 'typescriptreact', 'javascript', 'json' },
    opts = function()
      local null_ls = require 'null-ls'
      local opts = {
        sources = {
          null_ls.builtins.formatting.gofumpt,
          null_ls.builtins.formatting.goimports_reviser,
          null_ls.builtins.formatting.biome.with {
            args = {
              'check',
              '--apply-unsafe',
              '--stdin-file-path=$FILENAME',
            },
          },
        },
      }
      return opts
    end,
  },
}
