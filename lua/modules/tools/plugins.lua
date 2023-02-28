-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local package = require('core.pack').package
local setup = require('core.pack').setup
local conf = require('modules.tools.config')

package({
  'williamboman/mason.nvim',
  cmd = 'Mason',
})

package({
  'brenoprata10/nvim-highlight-colors',
  event = 'VeryLazy',
})

if vim.loop.os_uname().sysname == 'Linux' then
  package({
    'h-hg/fcitx.nvim',
  })
end
