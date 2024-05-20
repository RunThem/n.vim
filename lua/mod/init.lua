local uv = vim.loop
local api = vim.api

local lazy_path = string.format('%s/lazy/lazy.nvim', util.datapath())
if not uv.fs_stat(lazy_path) then
  local cmd = '!git clone https://github.com/folke/lazy.nvim ' .. lazy_path
  api.nvim_command(cmd)
end

vim.opt.runtimepath:prepend(lazy_path)

local lazy = require('lazy')
local repos = require('mod.pkg')

lazy.setup(repos, {
  lockfile = util.datapath('lazy-lock.json'),
})

require('mod.key')
