-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local g, api = vim.g, vim.api

_G.author = io.popen('git config user.name'):read('*l')
_G.email = io.popen('git config user.email'):read('*l')

-- disable_distribution_plugins
g.loaded_gzip = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_matchit = 1
g.loaded_matchparen = 1
g.loaded_2html_plugin = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1

-- Use space as leader key
g.mapleader = ' '

-- leaderkey
api.nvim_set_keymap('n', ' ', '', { noremap = true })
api.nvim_set_keymap('x', ' ', '', { noremap = true })

require('core.pack'):boot_strap()
require('core.options')

require('keymap')
