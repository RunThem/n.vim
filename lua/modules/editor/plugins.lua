-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local package = require('core.pack').package
local setup = require('core.pack').setup
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
  config = conf.treesitter,
})

package({
  'phaazon/hop.nvim',
  event = 'BufRead',
  config = setup('hop'),
})

package({
  'akinsho/toggleterm.nvim',
  config = setup('toggleterm'),
})

package({
  'm4xshen/autoclose.nvim',
  event = 'InsertEnter',
  config = setup('autoclose'),
})

package({ 'folke/todo-comments.nvim', event = 'BufRead', config = conf.todo_comments })

package({ 'dwrdx/mywords.nvim' })

package({ 'glepnir/coman.nvim' })

package({ 'nathom/filetype.nvim' })
