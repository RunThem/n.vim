-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local package = require('core.pack').package
local conf = require('modules.editor.config')
local setup = require('core.pack').setup

package({
  'neovim/nvim-lspconfig',
  ft = { 'lua', 'rust', 'c', 'cpp', 'go', 'zig', 'sh' },
  config = conf.nvim_lsp,
  dependencies = {
    {
      -- 'glepnir/lspsaga.nvim',
      -- config = setup('lspsaga'),

      'RunThem/LspUI.nvim',
      config = setup('LspUI'),
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

package({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzy-native.nvim',
  },
})

package({
  'nvim-treesitter/nvim-treesitter',
  ft = { 'lua', 'rust', 'c', 'cpp', 'go' },
  event = 'VeryLazy',
  config = conf.treesitter,
})

package({
  'folke/todo-comments.nvim',
  event = 'VeryLazy',
  config = conf.todo_comments,
})

package({
  'glepnir/easyformat.nvim',
  ft = { 'c', 'cpp', 'rust', 'lua', 'go' },
  event = 'VeryLazy',
  config = conf.easyformat,
})

package({
  'NvChad/nvterm',
  event = 'VeryLazy',
  config = setup('nvterm'),
})

package({
  'm4xshen/autoclose.nvim',
  event = 'VeryLazy',
  config = setup('autoclose'),
})

package({
  'glepnir/coman.nvim',
  event = 'VeryLazy',
  config = setup('autoclose'),
})

package({
  'dwrdx/mywords.nvim',
  event = 'VeryLazy',
})
