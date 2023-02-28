-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local package = require('core.pack').package
local conf = require('modules.completion.config')

package({
  'neovim/nvim-lspconfig',
  ft = { 'lua', 'rust', 'c', 'cpp', 'go', 'zig', 'sh' },
  config = conf.nvim_lsp,
  dependencies = {
    {
      -- 'glepnir/lspsaga.nvim',
      -- config = setup('lspsaga'),

      'RunThem/LspUI.nvim',
      -- dir = '/home/iccy/Code/i_lua/LspUI.nvim',
    },
  },
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
  },
})

package({
  'dcampos/nvim-snippy',
  event = 'InsertCharPre',
})
