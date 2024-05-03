-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'voldikss/vim-floaterm',
    keys = {
      { '<leader>gg', '<cmd>FloatermNew --autoclose=2 --title=lazygit lazygit<cr>', desc = 'Open LazyGit' },
    },
  },
}
