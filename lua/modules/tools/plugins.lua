-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local package = require('core.pack').package
local setup = require('core.pack').setup
local conf = require('modules.tools.config')

package({
  'nvimdev/guard.nvim',
  ft = { 'c', 'cpp', 'rust', 'lua', 'go' },
  event = 'VeryLazy',
  config = conf.guard,
  dependencies = {
    'nvimdev/guard-collection',
  },
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
  'mvllow/modes.nvim',
  config = setup('modes'),
})

package({
  'NvChad/nvterm',
  event = 'VeryLazy',
  config = conf.nvterm,
})
