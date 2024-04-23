-- author: RunThem https://github.com/RunThem
-- date: 2023-10-03
-- License: MIT

local pkg = require('core.pack').pkg

--- ui
pkg({
  'RunThem/whiskyline.nvim',
  config = true,
  dependencies = {
    { 'kyazdani42/nvim-web-devicons' },
    {
      'glepnir/porcelain.nvim',
      -- 'folke/tokyonight.nvim',
      config = function()
        vim.cmd('colorscheme porcelain')
        -- vim.cmd('colorscheme tokyonight')

        require('modules.conf.hl')()
      end,
    },
  },
})

pkg({
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPost', 'BufNewFile' },
  build = ':TSUpdate',
  config = require('modules.conf.ts'),
})

pkg({
  'utilyre/sentiment.nvim',
  event = { 'VeryLazy' },
  config = true,
})

--- lsp
pkg({
  'neovim/nvim-lspconfig',
  config = require('modules.conf.lsp'),
})

pkg({
  'nvimdev/lspsaga.nvim',
  config = require('modules.conf.saga'),
})

pkg({
  'nvimdev/guard.nvim',
  event = { 'VeryLazy' },
  ft = { 'c', 'cpp', 'rust', 'lua', 'go', 'json' },
  config = require('modules.conf.guard'),
  dependencies = {
    { 'nvimdev/guard-collection' },
  },
})

pkg({
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  config = require('modules.conf.cmp'),
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-path' },
    { 'dcampos/cmp-snippy' },
    { 'RunThem/cmp-xmake' },

    { 'dcampos/nvim-snippy' },
    { 'onsails/lspkind-nvim' },
  },
})

--- tool
pkg({
  'nvimdev/coman.nvim',
  event = { 'VeryLazy' },
})

pkg({
  'nvimdev/flybuf.nvim',
  event = { 'VeryLazy' },
  config = true,
})

pkg({
  'RunThem/fzy.nvim',
  event = { 'VeryLazy' },
})

pkg({
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = require('modules.conf.pairs'),
})

pkg({
  'kevinhwang91/nvim-ufo',
  event = { 'BufReadPost', 'BufNewFile' },
  config = require('modules.conf.ufo'),
  dependencies = { 'kevinhwang91/promise-async' },
})
