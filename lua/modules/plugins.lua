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
  'kevinhwang91/nvim-treesitter',
  build = ':TSUpdate',
  config = require('modules.conf.ts'),
})

package({
  'mvllow/modes.nvim',
  config = setup('modes'),
})

package({
  'RunThem/whiskyline.nvim',
  config = setup('whiskyline'),
  dependencies = { 'glepnir/porcelain.nvim', 'kyazdani42/nvim-web-devicons' },
})

package({
  'kevinhwang91/nvim-ufo',
  config = require('modules.conf.ufo'),
  dependencies = { 'kevinhwang91/promise-async' },
})

--- lsp
package({
  'neovim/nvim-lspconfig',
  config = require('modules.conf.lsp'),
})

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

package({
  'nvimdev/lspsaga.nvim',
  config = require('modules.conf.saga'),
})

package({
  'nvimdev/guard.nvim',
  ft = { 'c', 'cpp', 'rust', 'lua', 'go', 'json' },
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
  'RunThem/fzy.nvim',
})

package({
  'windwp/nvim-autopairs',
  config = require('modules.conf.pairs'),
})

package({
  'utilyre/sentiment.nvim',
  config = setup('sentiment'),
})
