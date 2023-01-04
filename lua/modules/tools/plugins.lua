-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local package = require('core.pack').package
local conf = require('modules.tools.config')

package({
  'kyazdani42/nvim-tree.lua',
  cmd = 'NvimTreeToggle',
  config = conf.nvim_tree,
  requires = 'kyazdani42/nvim-web-devicons',
})

package({
  'williamboman/mason.nvim',
  config = function()
    require('mason').setup({})
  end,
})

package({ 'dwrdx/mywords.nvim' })

package({ 'glepnir/coman.nvim' })

package({ 'h-hg/fcitx.nvim' })

package({ 'nathom/filetype.nvim' })
