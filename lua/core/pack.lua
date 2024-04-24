local uv, api = vim.loop, vim.api
local util = require('core.util')

local M = {}
M.__index = M

function M:init()
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

function M.pkg(repo)
  if not M.repos then
    M.repos = {}
  end
  table.insert(M.repos, repo)
end

return M
