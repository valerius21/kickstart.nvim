-- NOTE: kickstart.debug has the delve implementation,
-- root init.nvim has added dependencies as needed. I'm not going to verbosly redefine
-- it here for now.
return {
  -- Plugins used:
  --
  -- goimports-reviser
  -- golines
  -- delve
  -- gofumpt
  {
    'olexsmir/gopher.nvim',
    ft = 'go',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'mfussenegger/nvim-dap',
    },
    build = function()
      vim.cmd.GoInstallDeps()
    end,
    ---@type gopher.Config
    opts = {},
  },
  {
    'nvimtools/none-ls.nvim',
    ft = 'go',
    dependencies = { 'olexsmir/gopher.nvim' },
    config = function()
      local null_ls = require 'null-ls'
      local gopher = require 'gopher'

      local function get_struct_predicate(node)
        while node do
          if node:type() == 'type_spec' then
            for child in node:iter_children() do
              if child:type() == 'struct_type' then
                return true
              end
            end
          end
          node = node:parent()
        end
        return false
      end

      local function create_tag_picker(title, tag_action)
        return function()
          require('telescope.pickers')
            .new({}, {
              prompt_title = title,
              finder = require('telescope.finders').new_table {
                results = { 'xml', 'json', 'yaml' },
              },
              sorter = require('telescope.config').values.generic_sorter {},
              attach_mappings = function(prompt_bufnr)
                require('telescope.actions').select_default:replace(function()
                  require('telescope.actions').close(prompt_bufnr)
                  local selection = require('telescope.actions.state').get_selected_entry()
                  tag_action(selection[1])
                end)
                return true
              end,
            })
            :find()
        end
      end

      null_ls.register {
        name = 'Go Code Actions',
        method = null_ls.methods.CODE_ACTION,
        filetypes = { 'go' },
        generator = {
          fn = function()
            if not get_struct_predicate(vim.treesitter.get_node()) then
              return {}
            end
            return {
              { title = 'Add Tags', action = create_tag_picker('Select tag type', gopher.tags.add) },
              { title = 'Remove Tags', action = create_tag_picker('Select tag type to remove', gopher.tags.rm) },
            }
          end,
        },
      }
    end,
  },
}
