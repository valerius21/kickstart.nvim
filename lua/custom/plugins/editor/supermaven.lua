return {
  { -- NOTE: While I do like this plugin, it is still in early development
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {
        keymaps = {
          accept_suggestion = '<C-j>',
          clear_suggestion = '<C-]>',
          accept_word = '<C-y>',
        },
        ignore_filetypes = { cpp = true },
        color = {
          suggestion_color = '#ffffff',
          cterm = 244,
        },
      }
    end,
  },
}
