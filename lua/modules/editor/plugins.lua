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
    'nvim-telescope/telescope-fzy-native.nvim',
  },
})

package({
  'nvim-treesitter/nvim-treesitter',
  ft = { 'lua', 'rust', 'c', 'cpp', 'go' },
  event = 'VeryLazy',
  config = conf.treesitter,
})

package({
  'folke/todo-comments.nvim',
  event = 'VeryLazy',
  config = conf.todo_comments,
})

package({
  'glepnir/easyformat.nvim',
  ft = { 'c', 'cpp', 'rust', 'lua', 'go' },
  event = 'VeryLazy',
  config = conf.easyformat,
})

package({
  'phaazon/hop.nvim',
  event = 'VeryLazy',
  config = function()
    require('hop').setup({})
  end,
})

package({
  'NvChad/nvterm',
  event = 'VeryLazy',
  config = function()
    require('nvterm').setup({})
  end,
})

package({
  'm4xshen/autoclose.nvim',
  event = 'VeryLazy',
  config = function()
    require('autoclose').setup({})
  end,
})

package({
  'glepnir/coman.nvim',
  event = 'VeryLazy',
  config = function()
    require('autoclose').setup({})
  end,
})

package({
  'dwrdx/mywords.nvim',
  event = 'VeryLazy',
})
