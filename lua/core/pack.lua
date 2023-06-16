-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local uv, api = vim.loop, vim.api
local util = require('core.util')

local pack = {}
pack.__index = pack

function pack:load_modules_packages()
  local modules_dir = util.conf_path() .. '/lua/modules'
  self.repos = {}

  local list = vim.fs.find('plugins.lua', { path = modules_dir, type = 'file', limit = 10 })
  if #list == 0 then
    return
  end

  for _, f in pairs(list) do
    local _, pos = f:find(modules_dir)
    f = f:sub(pos - 6, #f - 4)
    require(f)
  end
end

function pack:boot_strap()
  local lazy_path = string.format('%s/lazy/lazy.nvim', util.data_path())
  local state = uv.fs_stat(lazy_path)
  if not state then
    local cmd = '!git clone https://github.com/folke/lazy.nvim ' .. lazy_path
    api.nvim_command(cmd)
  end

  vim.opt.runtimepath:prepend(lazy_path)

  local lazy = require('lazy')
  local opts = {
    lockfile = util.data_path() .. '/lazy-lock.json',
  }

  self:load_modules_packages()
  lazy.setup(self.repos, opts)
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
