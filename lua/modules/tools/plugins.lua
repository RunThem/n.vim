-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local package = require('core.pack').package
local setup = require('core.pack').setup
local conf = require('modules.tools.config')

package({
  'williamboman/mason.nvim',
  config = setup('mason'),
})

package({
  'brenoprata10/nvim-highlight-colors',
  config = setup('nvim-highlight-colors'),
})

package({ 'h-hg/fcitx.nvim' })
