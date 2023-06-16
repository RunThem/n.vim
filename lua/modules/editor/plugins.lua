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
  'echasnovski/mini.completion',
  config = conf.completion,
})

package({
  'glepnir/lspsaga.nvim',
  event = 'BufRead',
  dev = false,
  config = setup('lspsaga'),
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
