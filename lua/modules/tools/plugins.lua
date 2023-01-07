-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local package = require('core.pack').package
local setup = require('core.pack').setup

package({
  'williamboman/mason.nvim',
  config = setup('mason'),
})

package({ 'h-hg/fcitx.nvim' })
