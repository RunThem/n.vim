-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.tools.config')

plugin({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    { 'nvim-lua/popup.nvim', opt = true },
    { 'nvim-lua/plenary.nvim', opt = true },
    { 'nvim-telescope/telescope-fzy-native.nvim', opt = true },
  },
})

plugin({ 'dwrdx/mywords.nvim' })

plugin({ 'b3nj5m1n/kommentary', config = conf.kommentary })

plugin({ 'folke/todo-comments.nvim', config = conf.todo_comments })

plugin({ 'windwp/nvim-autopairs', config = conf.autopairs })

plugin({ 'anuvyklack/pretty-fold.nvim', config = conf.pretty_fold })

plugin({ 'williamboman/mason.nvim', config = conf.mason })

plugin({ 'mhartington/formatter.nvim', config = conf.formatter })
