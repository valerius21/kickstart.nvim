-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- [[ Keybindings ]]
-- display tabstops as two spaces
vim.opt.tabstop = 2

-- windows
vim.keymap.set('n', '<leader>wd', '<C-w>c', { desc = 'Close current window' })
vim.keymap.set('n', '<leader>|', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>-', '<C-w>s', { desc = 'Split window horizontally' })

-- buffers
vim.keymap.set('n', '<leader>bd', '<cmd>quit<cr>', { desc = 'Close current window' })

-- movement
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move half a page down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move half a page down' })

-- other
vim.keymap.set('n', '<C-s>', '<cmd>write<cr>', { desc = 'save the current file' })

-- LSP actions
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Rename Symbol' })

return {
  { import = 'custom.plugins.editor' },
  { import = 'custom.plugins.lang' },
}
