local M = {}

local pkg = function(repo)
  table.insert(M, repo)
end

pkg({
  'neovim/nvim-lspconfig',
  config = require('mod.conf.lsp'),
})

pkg({
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPost', 'BufNewFile' },
  build = ':TSUpdate',
  config = require('mod.conf.ts'),
})

pkg({
  'nvimdev/lspsaga.nvim',
  event = { 'VeryLazy' },
  config = require('mod.conf.saga'),
})

pkg({
  'kevinhwang91/nvim-ufo',
  event = { 'VeryLazy' },
  config = require('mod.conf.ufo'),
  dependencies = { 'kevinhwang91/promise-async' },
})

pkg({
  'nvimdev/guard.nvim',
  event = { 'VeryLazy' },
  config = require('mod.conf.guard'),
  dependencies = { 'nvimdev/guard-collection' },
})

pkg({
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

return M
