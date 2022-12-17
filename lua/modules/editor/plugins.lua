-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.editor.config')

plugin({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    { 'nvim-lua/plenary.nvim', opt = true },
    { 'nvim-telescope/telescope-fzy-native.nvim', opt = true },
  },
})

plugin({
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  run = ':TSUpdate',
  after = 'telescope.nvim',
  config = conf.nvim_treesitter,
})

plugin({ 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' })

plugin({ 'folke/todo-comments.nvim', config = conf.todo_comments })

plugin({ 'windwp/nvim-autopairs', event = 'InsertEnter', config = conf.autopairs })

plugin({ 'phaazon/hop.nvim', event = 'BufRead', config = conf.hop })

plugin({ 'akinsho/toggleterm.nvim', config = conf.toggleterm })

plugin({ 'nvim-treesitter/playground', after = 'nvim-treesitter' })
