return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load

      vim.cmd.colorscheme 'catppuccin-mocha'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'folke/tokyonight.nvim',
    init = function()
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  { 'projekt0n/github-nvim-theme' },
}
