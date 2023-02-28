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
  ft = { 'lua', 'rust', 'c', 'cpp', 'go' },
  event = 'BufRead',
  run = ':TSUpdate',
  after = 'telescope.nvim',
  config = conf.treesitter,
})

package({
  'folke/todo-comments.nvim',
  event = 'BufRead',
  config = conf.todo_comments,
})

package({
  'phaazon/hop.nvim',
  event = 'BufRead',
})

package({
  'NvChad/nvterm',
})

package({
  'm4xshen/autoclose.nvim',
  event = 'InsertEnter',
})

package({
  'glepnir/easyformat.nvim',
  ft = { 'c', 'cpp', 'rust', 'lua', 'go' },
  config = conf.easyformat,
})

package({ 'dwrdx/mywords.nvim' })

package({ 'glepnir/coman.nvim' })
