return {
  {
    'nvim-treesitter/nvim-treesitter',
    ft = 'python',
    opts = { ensure_installed = { 'ninja', 'rst' } },
  },
  {
    'linux-cultist/venv-selector.nvim',
    ft = 'python',
    branch = 'regexp', -- Use this branch for the new version
    cmd = 'VenvSelect',
    opts = {
      settings = {
        options = {
          notify_user_on_venv_activation = true,
        },
      },
    },
    --  Call config for python files and load the cached venv automatically
    keys = { { '<leader>cv', '<cmd>:VenvSelect<cr>', desc = 'Select VirtualEnv', ft = 'python' } },
  },
}
