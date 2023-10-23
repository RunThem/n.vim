-- author: RunThem https://github.com/RunThem
-- date: 2023-10-03
-- License: MIT

local package = require('core.pack').package
local setup = require('core.pack').setup

--- ui
package({
  -- 'glepnir/zephyr-nvim',
  'glepnir/porcelain.nvim',
  config = require('modules.conf.hl'),
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

if _G.epo == true then
  package({
    'nvimdev/epo.nvim',
    config = function()
      require('epo').setup({})
    end,
  })
else
  package({
    'hrsh7th/nvim-cmp',
    config = require('modules.conf.cmp'),
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'dcampos/cmp-snippy',
      'RunThem/cmp-xmake',

      'dcampos/nvim-snippy',
      'onsails/lspkind-nvim',
    },
  })
end

package({
  'nvimdev/lspsaga.nvim',
  config = require('modules.conf.lspsaga'),
})

package({
  'nvimdev/guard.nvim',
  ft = { 'c', 'cpp', 'rust', 'lua', 'go' },
  config = require('modules.conf.guard'),
  dependencies = {
    'nvimdev/guard-collection',
  },
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
