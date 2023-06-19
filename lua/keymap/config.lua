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
  local key = ''

  if vim.fn.pumvisible() ~= 0 then
    local info = vim.fn.complete_info()

    key = '<C-y>'
    if info.selected == -1 then
      info.selected = 0
      key = '<C-n><C-y>'
    end

    -- require('lua.core.util').info(info.items[info.selected + 1].abbr)

    if string.find(info.items[info.selected + 1].abbr, '(.*)') ~= nil then
      key = key .. '()<Esc>i'
    end
  else
    key = '<Cr>'
  end

  return key
end
