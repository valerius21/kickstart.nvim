return {
  {
    'm4xshen/hardtime.nvim',
    event = 'VeryLazy',
    dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
    opts = {
      -- disabled_filetypes = { 'qf', 'netrw', 'NvimTree', 'lazy', 'mason', 'oil' },
      disable_mouse = false,
      restriction_mode = 'hint', -- NOTE: can be 'hint' for non-blocking suggestions
    },
  },
}
