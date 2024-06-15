-- plugins/telescope.lua:
local mapKeys = require("utils.keyMapper").mapKey
return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    
    config = function()
      local builtin = require("telescope.builtin")
      mapKeys('<leader>tf', builtin.find_files)  -- Find file in cwd.
      mapKeys('<leader>tg', builtin.live_grep)   -- Find string in cwd.
      mapKeys('<leader>t*', builtin.grep_string) -- Find string under cursor in cwd
      mapKeys('<leader>tb', builtin.buffers)     -- List of Recent.
      mapKeys('<leader>th', builtin.help_tags)
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require('telescope').setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
