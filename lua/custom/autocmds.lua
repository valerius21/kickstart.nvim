-- [[
-- Auto commands
-- ]]
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    -- Run oil.nvim when starting vim
    vim.cmd 'Oil'
  end,
})
