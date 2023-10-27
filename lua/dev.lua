local M = {}

local u = require('core.util')
local api, fn, ts = vim.api, vim.fn, vim.treesitter

local inf = u.info

function M.script()
  local cmd = io.popen(u.conf_path() .. '/lua/script.lua ')
  local out = cmd:read('*l')

  cmd:close()

  u.cwrite(out)
end

function M.setup()
  inf(u.cur_line())
end

return M
