-- author: m4xshen https://github.com/m4xshen
-- date: 2023-06-19
-- License: MIT

local keys = {
  ['('] = { escape = false, close = true, pair = '()' },
  ['['] = { escape = false, close = true, pair = '[]' },
  ['{'] = { escape = false, close = true, pair = '{}' },

  ['>'] = { escape = true, close = false, pair = '<>' },
  [')'] = { escape = true, close = false, pair = '()' },
  [']'] = { escape = true, close = false, pair = '[]' },
  ['}'] = { escape = true, close = false, pair = '{}' },

  ['"'] = { escape = true, close = true, pair = '""' },
  ["'"] = { escape = true, close = true, pair = "''" },
  ['`'] = { escape = true, close = true, pair = '``' },

  [' '] = { escape = false, close = true, pair = '  ' },

  ['<BS>'] = {},
}

local function get_pair()
  -- add "_" to let close function work in the first col
  local line = '_' .. vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1

  return line:sub(col, col + 1)
end

local function is_pair(pair)
  for _, info in pairs(keys) do
    if pair == info.pair then
      return true
    end
  end

  return false
end

local function handler(key, info)
  local pair = get_pair()

  if key == '<BS>' and is_pair(pair) then
    return '<BS><Del>'
  elseif info.escape and pair:sub(2, 2) == key then
    return '<C-G>U<Right>'
  elseif info.close then
    -- disable if the cursor touches alphanumeric character
    if (get_pair() .. '_'):sub(2, 2):match('%w') then
      return key
    end

    -- don't pair spaces
    if key == ' ' and (not is_pair(pair) or pair:sub(1, 1) == pair:sub(2, 2)) then
      return key
    end

    return info.pair .. '<C-G>U<Left>'
  else
    return key
  end
end

for key, info in pairs(keys) do
  vim.keymap.set('i', key, function()
    return (key == ' ' and '<C-]>' or '') .. handler(key, info)
  end, { noremap = true, expr = true })
end
