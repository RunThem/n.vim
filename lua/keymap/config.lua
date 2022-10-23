-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT
-- recommend some vim mode key defines in this file

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

--- move to prev/next item in completion menuone
_G.smart_tab = function()
  local cmp = require('cmp')

  if cmp.visible() then
    return '<C-n>'
  elseif has_words_before() then
    return '<Tab>'
  else
    return '<Tab>'
  end
end

_G.smart_shift_tab = function()
  local cmp = require('cmp')

  if cmp.visible() then
    return '<C-p>'
  else
    return '<S-Tab>'
  end
end
