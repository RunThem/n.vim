local M = {}

local api, fn, ts, lpeg = vim.api, vim.fn, vim.treesitter, vim.lpeg
local inf = vim.print

function M.setup()
  inf('Hello Neovim!!!')
end

return M
