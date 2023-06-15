-- author: glepnr https://github.com/glepnir
-- date: 2023-03-28
-- License: MIT

local package = require('core.pack').package
local conf = require('modules.ui.config')
local setup = require('core.pack').setup

package({
  'glepnir/zephyr-nvim',
  -- 'glepnir/porcelain.nvim',
  config = conf.colorscheme,
})

package({
  'echasnovski/mini.tabline',
  config = setup('mini.tabline'),
  dependencies = { 'kyazdani42/nvim-web-devicons' },
})

package({
  'glepnir/flybuf.nvim',
  event = 'VeryLazy',
  config = setup('flybuf'),
})

package({
  'RunThem/whiskyline.nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  config = setup('whiskyline'),
})
