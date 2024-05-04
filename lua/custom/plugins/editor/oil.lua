return {
  { -- file navigation / neotree alternative
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VimEnter',
    keys = {
      { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
    },
    opts = {},
  },
}
