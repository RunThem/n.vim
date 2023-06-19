-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT
-- recommend some vim mode key defines in this file

--- move to prev/next item in completion menuone
_G.smart_tab = function()
  if vim.fn.pumvisible() ~= 0 then
    return '<C-n>'
  else
    return '<Tab>'
  end
end

_G.smart_shift_tab = function()
  if vim.fn.pumvisible() ~= 0 then
    return '<C-p>'
  else
    return '<S-Tab>'
  end
end

_G.smart_enter = function()
  if vim.fn.pumvisible() ~= 0 then
    return '<C-y>'
  else
    return '<Cr>'
  end
end
