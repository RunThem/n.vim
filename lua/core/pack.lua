-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local uv, api = vim.loop, vim.api
local util = require('core.util')

local pack = {}
pack.__index = pack

function pack:init()
  local lazy_path = string.format('%s/lazy/lazy.nvim', util.data_path())
  local state = uv.fs_stat(lazy_path)
  if not state then
    local cmd = '!git clone https://github.com/folke/lazy.nvim ' .. lazy_path
    api.nvim_command(cmd)
  end

  vim.opt.runtimepath:prepend(lazy_path)

  require('modules.plugins')

  require('lazy').setup(self.repos, { lockfile = util.data_path() .. '/lazy-lock.json' })

  require('modules.keymaps')
end

function pack.package(repo)
  if not pack.repos then
    pack.repos = {}
  end
  table.insert(pack.repos, repo)
end

function pack.setup(mod)
  return function()
    local ok, m = pcall(require, mod)
    if ok then
      m.setup({})
    end
  end
end

return pack
