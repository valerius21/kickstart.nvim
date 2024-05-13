local file_types = {
  'javascript',
  'javascriptreact',
  'json',
  'typescript',
  'typescriptreact',
}

return {
  {
    'neovim/nvim-lspconfig',
    ft = file_types,
    enable = false,
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    ft = { 'typescript', 'typescriptreact' },
    opts = {
      settings = {
        code_lens = 'off',
        expose_as_code_action = { 'fix_all', 'add_missing_imports', 'remove_unused', 'remove_unused_imports' },
      },
    },
    -- NOTE: should normally be handled by biome or something else on save
    keys = {
      { '<C-M-o>', '<cmd>TSToolsOrganizeImports<cr>', { desc = 'Organize the imports' } },
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
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, 'biome')
      table.insert(opts.ensure_installed, 'typescript-language-server')
      table.insert(opts.ensure_installed, 'tailwindcss-language-server')
      return opts
    end,
  },
  {
    'nvimtools/none-ls.nvim',
    event = 'VeryLazy',
    ft = file_types,
    opts = function(_, opts)
      local nls = require 'null-ls'
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.formatting.biome.with {
          args = {
            'check',
            '--apply-unsafe',
            '--stdin-file-path=$FILENAME',
          },
        },
      })
      return opts
    end,
  },
}
