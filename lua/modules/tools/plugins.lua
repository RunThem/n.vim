-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.tools.config')

plugin({
  'kyazdani42/nvim-tree.lua',
  cmd = 'NvimTreeToggle',
  config = conf.nvim_tree,
  requires = 'kyazdani42/nvim-web-devicons',
})

plugin({ 'dwrdx/mywords.nvim' })

plugin({ 'williamboman/mason.nvim', config = conf.mason })

plugin({ 'glepnir/coman.nvim', after = 'nvim-treesitter' })

