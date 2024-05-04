return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    ft = { 'typescript', 'typescriptreact' },
    opts = {
      settings = {
        code_lens = 'all',
        expose_as_code_action = { 'fix_all', 'add_missing_imports', 'remove_unused', 'remove_unused_imports' },
      },
    },
  },
  {
    'nvimtools/none-ls.nvim',
    ft = { 'typescript', 'typescriptreact', 'javascript', 'json' },
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
      }
      return opts
    end,
  },
}
