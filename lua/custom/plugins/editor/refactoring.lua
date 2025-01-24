return {
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    ft = {
      'typescript',
      'javascript',
      'lua',
      'c',
      'cpp',
      'go',
      'python',
      'java',
      'php',
      'ruby',
      'cs',
    },
    config = function()
      require('refactoring').setup()
    end,
  },
}
