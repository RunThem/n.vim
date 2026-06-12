local M = {}

local mod = function(repo)
  table.insert(M, repo)
end

-- mod({
--   'nvim-treesitter/nvim-treesitter',
--   lazy = false,
--   version = 'main',
--   config = require('mod.conf.ts'),
-- })

mod({
  'arborist-ts/arborist.nvim',
  event = { 'VeryLazy' },
  config = require('mod.conf.arborist'),
})

mod({
  'nvimdev/lspsaga.nvim',
  event = { 'VeryLazy' },
  config = require('mod.conf.saga'),
})

mod({
  'chrisgrieser/nvim-origami',
  event = { 'VeryLazy' },
  config = require('mod.conf.origami'),
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
  config = require('mod.conf.blink').indent,
})

mod({
  'saghen/blink.pairs',
  version = '*',
  event = { 'VeryLazy' },
  config = require('mod.conf.blink').pairs,
  dependencies = { 'saghen/blink.download' },
})

mod({
  'saghen/blink.cmp',
  version = '1.*',
  event = { 'VeryLazy' },
  config = require('mod.conf.blink').cmp,
})

return M
