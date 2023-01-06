-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local package = require('core.pack').package

package({
  'williamboman/mason.nvim',
  config = function()
    require('mason').setup({})
  end,
})

package({ 'h-hg/fcitx.nvim' })
