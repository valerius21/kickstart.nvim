-- NOTE: take a look at https://github.com/folke/snacks.nvim/blob/main/docs/terminal.md in the future
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
    opts = {},
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
