return {
  {
    'tris203/precognition.nvim',
    event = 'VeryLazy',
    -- Run function for when a buffer is opened
    config = function()
      local plugin = require 'precognition'
      plugin.setup()
      plugin.show()
      return plugin
    end,
  },
}
