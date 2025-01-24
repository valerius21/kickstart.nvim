-- NOTE: maybe try persistence.nvim
return {
  {
    'rmagatti/auto-session',
    opts = {},
  },
  {
    'rmagatti/session-lens',
    dependencies = {
      'rmagatti/auto-session',
      'nvim-telescope/telescope.nvim',
    },
    opts = {
      supressed_dirs = { '~/', '~/Downloads', '/' },
    },
    keys = {
      {
        '<leader>sS',
        '<cmd>Telescope session-lens search_session<cr>',
        mode = 'n',
        desc = '[s]earch [S]essions',
      },
    },
  },
}
