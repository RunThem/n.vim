-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local package = require('core.pack').package
local conf = require('modules.editor.config')
local ft = require('modules.editor.config').ft
local setup = require('core.pack').setup

package({
  'neovim/nvim-lspconfig',
  ft = ft,
  config = conf.nvim_lsp,
})

package({
  'glepnir/lspsaga.nvim',
  event = 'BufRead',
  dev = false,
  config = conf.lspsaga,
})

package({
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  config = conf.nvim_cmp,
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'dcampos/cmp-snippy',
    'RunThem/cmp-xmake',

    'onsails/lspkind-nvim',
    'dcampos/nvim-snippy',
  },
})

package({
  'nvim-treesitter/nvim-treesitter',
  ft = ft,
  event = 'VeryLazy',
  config = conf.treesitter,
})

package({
  'glepnir/coman.nvim',
  event = 'VeryLazy',
})
