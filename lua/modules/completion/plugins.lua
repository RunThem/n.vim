-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.completion.config')

plugin({
  'neovim/nvim-lspconfig',
  ft = { 'lua', 'rust', 'c', 'cpp', 'go', 'zig', 'sh' },
  config = conf.nvim_lsp,
})

plugin({
  'glepnir/lspsaga.nvim',
  branch = 'main',
  config = conf.lspsaga,
})

plugin({
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  config = conf.nvim_cmp,
  requires = {
    { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-lspconfig' },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    { 'onsails/lspkind-nvim' },
    { 'dcampos/cmp-snippy', after = 'nvim-snippy' },
  },
})

plugin({ 'dcampos/nvim-snippy', event = 'InsertCharPre', config = conf.snippy })
