return {
  {
    'nvimtools/none-ls.nvim',
    ft = { 'typescript', 'typescriptreact', 'javascript', 'json' },
    opts = function()
      local null_ls = require 'null-ls'
      local opts = {
        sources = {
          -- Go
          null_ls.builtins.formatting.golines,
          -- Typscript with React
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
