return {
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    ft = {
      'c',
      'cpp',
      'cs',
      'go',
      'java',
      'javascript',
      'lua',
      'php',
      'python',
      'ruby',
      'typescript',
    },
    config = function()
      require('refactoring').setup()
    end,
  },
}
