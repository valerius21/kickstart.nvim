return {
  {
    'hedyhli/outline.nvim',
    lazy = true,
    cmd = { 'Outline', 'OutlineOpen' },
    keys = {
      { '<leader>co', '<cmd>Outline<CR>', desc = 'Toggle outline' },
    },
    opts = {},
  },
}
