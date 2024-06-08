local M = {}

local mod = function(repo)
  table.insert(M, repo)
end

mod({
  'neovim/nvim-lspconfig',
  config = require('mod.conf.lsp'),
})

mod({
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPost', 'BufNewFile' },
  build = ':TSUpdate',
  config = require('mod.conf.ts'),
})

mod({
  'nvimdev/lspsaga.nvim',
  event = { 'VeryLazy' },
  config = require('mod.conf.saga'),
})

mod({
  'kevinhwang91/nvim-ufo',
  event = { 'VeryLazy' },
  config = require('mod.conf.ufo'),
  dependencies = { 'kevinhwang91/promise-async' },
})

mod({
  'nvimdev/guard.nvim',
  event = { 'VeryLazy' },
  config = require('mod.conf.guard'),
  dependencies = { 'nvimdev/guard-collection' },
})

-- mod({
--   'nvimdev/epo.nvim',
--   config = require('mod.conf.epo'),
-- })

mod({
  'hrsh7th/nvim-cmp',
  event = { 'InsertEnter' },
  config = require('mod.conf.cmp'),
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

mod({
  'folke/lazydev.nvim',
  ft = { 'lua' },
  opts = { library = { 'luvit-meta/library' } },
  dependencies = {
    'Bilal2453/luvit-meta',
  },
})

return M
