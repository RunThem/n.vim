-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local g, fn, api = vim.g, vim.fn, vim.api
-- remove check is windows because I only use mac or linux
local help = require('core.helper')
local cache_dir = help.get_cache_path()

-- Create cache dir and subs dir
local createdir = function()
  local data_dir = {
    cache_dir .. 'backup',
    cache_dir .. 'session',
    cache_dir .. 'swap',
    cache_dir .. 'tags',
    cache_dir .. 'undo',
  }
  -- There only check once that If cache_dir exists
  -- Then I don't want to check subs dir exists
  if fn.isdirectory(cache_dir) == 0 then
    os.execute('mkdir -p ' .. cache_dir)
    for _, v in pairs(data_dir) do
      if fn.isdirectory(v) == 0 then
        os.execute('mkdir -p ' .. v)
      end
    end
  end
end

createdir()

_G.author = help.exec('git config user.name')
_G.email = help.exec('git config user.email')

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

local pack = require('core.pack')

pack.ensure_plugins()
require('core.options')
pack.load_compile()
require('keymap')
require('internal.event')
require('internal.formatter')
require('internal.lastplace')
