return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- NOTE: configuration options here:
      -- https://github.com/folke/noice.nvim?tab=readme-ov-file#-installation
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      -- NOTE:
      -- `nvim-notify` is only needed, if you want to use the notification view.
      -- If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
  },
}
