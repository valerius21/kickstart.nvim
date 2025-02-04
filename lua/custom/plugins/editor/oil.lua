return {
  {
    'stevearc/oil.nvim',
    -- event = 'VimEnter',
    keys = {
      { '-', '<cmd>Oil<cr>', desc = 'Oil.nvim' },
    },
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    -- dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
  },
}
