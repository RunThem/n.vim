local M = {}

local u = require('core.util')
local api, fn, ts = vim.api, vim.fn, vim.treesitter

local inf = u.info

function M.setup()
  inf(u.cline())
end

return M
