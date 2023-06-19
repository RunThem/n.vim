-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local package = require('core.pack').package
local setup = require('core.pack').setup
local conf = require('modules.tools.config')

package({
  'folke/todo-comments.nvim',
  event = 'VeryLazy',
  config = conf.todo_comments,
})

package({
  'nvimdev/guard.nvim',
  ft = { 'c', 'cpp', 'rust', 'lua', 'go' },
  event = 'VeryLazy',
  config = conf.guard,
})

package({
  'RunThem/fzy.nvim',
  -- dir = '/home/iccy/Code/i_lua/fzy.nvim/',
  event = 'VeryLazy',
})

package({
  'nvimdev/hlsearch.nvim',
  event = 'VeryLazy',
  config = setup('hlsearch'),
})

package({
  'nvimdev/flybuf.nvim',
  event = 'VeryLazy',
  config = setup('flybuf'),
})

package({
  'kdheepak/lazygit.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
})

package({
  'NvChad/nvterm',
  event = 'VeryLazy',
  config = conf.nvterm,
})
