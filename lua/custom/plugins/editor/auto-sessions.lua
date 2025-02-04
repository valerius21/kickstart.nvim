-- NOTE: maybe try persistence.nvim
return {
  {
    'rmagatti/auto-session',
    lazy = false,
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      no_restore_cmds = {
        function()
          -- load if there's no session
          require 'oil'
        end,
      },
    },
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
