local M = {}

local mod = function(repo)
  table.insert(M, repo)
end

mod({
  'neovim/nvim-lspconfig',
  event = { 'BufReadPost', 'BufNewFile' },
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
  event = { 'BufReadPost', 'BufNewFile' },
  config = require('mod.conf.saga'),
})

mod({
  'kevinhwang91/nvim-ufo',
  event = { 'BufReadPost', 'BufNewFile' },
  config = require('mod.conf.ufo'),
  dependencies = { 'kevinhwang91/promise-async' },
})

mod({
  'nvimdev/guard.nvim',
  commit = 'b066152fe06122b047a6b3ce427a19d8b6e628ce',
  event = { 'BufReadPost', 'BufNewFile' },
  config = require('mod.conf.guard'),
  dependencies = { 'nvimdev/guard-collection' },
})

mod({
  'mvllow/modes.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  config = require('mod.conf.modes'),
})

mod({
  'saghen/blink.cmp',
  build = 'cargo build --release',
  event = { 'BufReadPost', 'BufNewFile' },
  config = require('mod.conf.blink'),
})

mod({
  'folke/lazydev.nvim',
  ft = { 'lua' },
  opts = { library = { 'luvit-meta/library' } },
  dependencies = { 'Bilal2453/luvit-meta' },
})

-- mod({
--   'nvimdev/epo.nvim',
--   config = require('mod.conf.epo'),
-- })

-- mod({
--   'hrsh7th/nvim-cmp',
--   event = { 'InsertEnter' },
--   config = require('mod.conf.cmp'),
--   dependencies = {
--     { 'hrsh7th/cmp-nvim-lsp' },
--     { 'hrsh7th/cmp-nvim-lua' },
--     { 'hrsh7th/cmp-path' },
--     { 'dcampos/cmp-snippy' },
--     { 'RunThem/cmp-xmake' },
--
--     { 'dcampos/nvim-snippy' },
--     { 'onsails/lspkind-nvim' },
--   },
-- })

return M
