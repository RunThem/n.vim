-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local package = require('core.pack').package
local setup = require('core.pack').setup
local conf = require('modules.tools.config')

package({
  'williamboman/mason.nvim',
  cmd = 'Mason',
  config = setup('mason'),
})

package({
  'brenoprata10/nvim-highlight-colors',
  config = setup('nvim-highlight-colors'),
})

package({
  'JuanZoran/Trans.nvim',
  config = function()
    require('Trans').setup({
      hover = {
        animation = {
          open = 'fold',
          close = 'fold',
          interval = 1,
        },
      },
    })
  end,
  dependencies = {
    'kkharji/sqlite.lua',
  },
})

if vim.loop.os_uname().sysname == 'Linux' then
  package({
    'h-hg/fcitx.nvim',
  })
end
