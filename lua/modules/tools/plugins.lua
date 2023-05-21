-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local package = require('core.pack').package
local setup = require('core.pack').setup
local conf = require('modules.tools.config')

package({
  'brenoprata10/nvim-highlight-colors',
  config = setup('nvim-highlight-colors'),
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
  'NvChad/nvterm',
  event = 'VeryLazy',
  config = conf.nvterm,
})

package({
  'm4xshen/autoclose.nvim',
  event = 'VeryLazy',
  config = setup('autoclose'),
})

package({
  'RunThem/fzy.nvim',
  -- dir = '/home/iccy/Code/i_lua/fzy.nvim/',
  event = 'VeryLazy',
})

package({
  'nvimdev/hlsearch.nvim',
  event = 'BufRead',
  config = setup('hlsearch'),
})
