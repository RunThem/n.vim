-- author: RunThem https://github.com/RunThem
-- date: 2023-10-03
-- License: MIT

local pkg = require('core.pack').pkg
local setup = require('core.pack').setup

--- ui
pkg({
  -- 'glepnir/zephyr-nvim',
  'glepnir/porcelain.nvim',
  config = function()
    -- vim.cmd('colorscheme zephyr')
    vim.cmd('colorscheme porcelain')

    require('modules.conf.hl')()
  end,
})

pkg({
  'kevinhwang91/nvim-treesitter',
  build = ':TSUpdate',
  config = require('modules.conf.ts'),
})

pkg({
  'mvllow/modes.nvim',
  config = setup('modes'),
})

pkg({
  'RunThem/whiskyline.nvim',
  config = setup('whiskyline'),
  dependencies = { 'glepnir/porcelain.nvim', 'kyazdani42/nvim-web-devicons' },
})

pkg({
  'kevinhwang91/nvim-ufo',
  config = require('modules.conf.ufo'),
  dependencies = { 'kevinhwang91/promise-async' },
})

--- lsp
pkg({
  'neovim/nvim-lspconfig',
  config = require('modules.conf.lsp'),
})

pkg({
  'hrsh7th/nvim-cmp',
  config = require('modules.conf.cmp'),
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-path',
    'dcampos/cmp-snippy',
    'RunThem/cmp-xmake',

    'dcampos/nvim-snippy',
    'onsails/lspkind-nvim',
  },
})

pkg({
  'nvimdev/lspsaga.nvim',
  config = require('modules.conf.saga'),
})

pkg({
  'nvimdev/guard.nvim',
  ft = { 'c', 'cpp', 'rust', 'lua', 'go', 'json' },
  config = require('modules.conf.guard'),
  dependencies = { 'nvimdev/guard-collection' },
})

--- tool
pkg({
  'nvimdev/coman.nvim',
})

pkg({
  'nvimdev/hlsearch.nvim',
  config = setup('hlsearch'),
})

pkg({
  'nvimdev/flybuf.nvim',
  config = setup('flybuf'),
})

pkg({
  'RunThem/fzy.nvim',
})

pkg({
  'windwp/nvim-autopairs',
  config = require('modules.conf.pairs'),
})

pkg({
  'utilyre/sentiment.nvim',
  config = setup('sentiment'),
})
