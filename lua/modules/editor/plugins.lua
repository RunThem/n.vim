-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local package = require('core.pack').package
local conf = require('modules.editor.config')
local ft = require('modules.editor.config').ft
local setup = require('core.pack').setup

package({
  'neovim/nvim-lspconfig',
  config = conf.nvim_lsp,
})

package({
  'hrsh7th/nvim-cmp',
  event = 'VeryLazy',
  config = conf.cmp,
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'dcampos/cmp-snippy',
    'RunThem/cmp-xmake',

    'dcampos/nvim-snippy',
    'onsails/lspkind-nvim',
  },
})

package({
  'nvimdev/lspsaga.nvim',
  event = 'VeryLazy',
  config = setup('lspsaga'),
})

package({
  'nvim-treesitter/nvim-treesitter',
  ft = ft,
  event = 'VeryLazy',
  config = conf.treesitter,
})

package({
  'nvimdev/coman.nvim',
  event = 'VeryLazy',
})
