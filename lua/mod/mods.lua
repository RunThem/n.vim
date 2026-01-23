local M = {}

local mod = function(repo)
  table.insert(M, repo)
end

mod({
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  -- branch = 'main',
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

mod({
  'mvllow/modes.nvim',
  event = { 'VeryLazy' },
  config = require('mod.conf.modes'),
})

mod({
  'ibhagwan/fzf-lua',
  event = { 'VeryLazy' },
  config = require('mod.conf.fzf'),
})

mod({
  'saghen/blink.indent',
  event = { 'VeryLazy' },
})

mod({
  'saghen/blink.pairs',
  version = '*',
  event = { 'VeryLazy' },
  config = require('mod.conf.blink').pairs,
  dependencies = { 'saghen/blink.download' },
})

if vim.g.cmp == 'blink' then
  mod({
    'saghen/blink.cmp',
    version = '1.*',
    event = { 'VeryLazy' },
    config = require('mod.conf.blink').cmp,
  })
else
  mod({
    'hrsh7th/nvim-cmp',
    event = { 'VeryLazy' },
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
end

return M
