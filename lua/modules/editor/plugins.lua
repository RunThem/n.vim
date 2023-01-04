-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local package = require('core.pack').package
local conf = require('modules.editor.config')

package({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
})

package({
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  run = ':TSUpdate',
  after = 'telescope.nvim',
  config = conf.nvim_treesitter,
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
})

package({
  'phaazon/hop.nvim',
  event = 'BufRead',
  config = function()
    require('hop').setup({})
  end,
})

package({
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup({})
  end,
})

package({ 'folke/todo-comments.nvim', config = conf.todo_comments })

package({ 'windwp/nvim-autopairs', event = 'InsertEnter', config = conf.autopairs })
