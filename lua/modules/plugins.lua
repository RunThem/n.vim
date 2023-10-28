-- author: RunThem https://github.com/RunThem
-- date: 2023-10-03
-- License: MIT

local package = require('core.pack').package
local setup = require('core.pack').setup

--- ui
package({
  -- 'glepnir/zephyr-nvim',
  'glepnir/porcelain.nvim',
  config = function()
    -- vim.cmd('colorscheme zephyr')
    vim.cmd('colorscheme porcelain')

    require('modules.conf.hl')()
  end,
})

package({
  'mvllow/modes.nvim',
  config = setup('modes'),
})

package({
  'RunThem/whiskyline.nvim',
  config = setup('whiskyline'),
  dependencies = { 'kyazdani42/nvim-web-devicons' },
})

--- lsp
package({
  'neovim/nvim-lspconfig',
  config = require('modules.conf.lsp'),
})

package({
  -- 'nvimdev/epo.nvim',
  'RunThem/epo.nvim',
  -- dir = '/home/iccy/.config/nvim/epo.nvim/',
  config = require('modules.conf.epo'),
  dependencies = { 'onsails/lspkind-nvim' },
})

package({
  'nvimdev/lspsaga.nvim',
  config = require('modules.conf.saga'),
})

package({
  'nvimdev/guard.nvim',
  ft = { 'c', 'cpp', 'rust', 'lua', 'go' },
  config = require('modules.conf.guard'),
  dependencies = { 'nvimdev/guard-collection' },
})

--- tool
package({
  'nvimdev/coman.nvim',
})

package({
  'nvimdev/hlsearch.nvim',
  config = setup('hlsearch'),
})

package({
  'nvimdev/flybuf.nvim',
  config = setup('flybuf'),
})

package({
  -- 'RunThem/fzy.nvim',
  -- dir = '/home/iccy/Code/i_lua/fzy.nvim/',

  'mfussenegger/nvim-fzy',
})

package({
  'windwp/nvim-autopairs',
  config = require('modules.conf.pairs'),
})
