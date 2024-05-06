return {
  { -- file navigation / neotree alternative
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VimEnter',
    keys = {
      { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
    },
    opts = {
      keymaps = {
        -- deactivate conflicting keymaps with vim-tmux
        ['<C-h>'] = false,
        ['<C-j>'] = false,
        ['<C-k>'] = false,
        ['<C-l>'] = false,
      },
    },
  },
}
