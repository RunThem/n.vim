-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local package = require('core.pack').package
local conf = require('modules.ui.config')
local setup = require('core.pack').setup

package({
  -- 'glepnir/zephyr-nvim',
  'glepnir/porcelain.nvim',
  config = conf.porcelain,
})

package({
  'glepnir/galaxyline.nvim',
  event = 'VeryLazy',
  config = conf.galaxyline,
  dependencies = { 'kyazdani42/nvim-web-devicons' },
})

package({
  'akinsho/nvim-bufferline.lua',
  event = 'VeryLazy',
  config = conf.nvim_bufferline,
  dependencies = 'kyazdani42/nvim-web-devicons',
})

package({
  'glepnir/flybuf.nvim',
  event = 'VeryLazy',
  config = setup('flybuf'),
})
