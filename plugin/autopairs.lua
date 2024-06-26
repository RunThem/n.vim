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

  ['<Bs>'] = {},
  ['<C-h>'] = {},
  ['<C-w>'] = {},

  ['<Cr>'] = {},
  ['<S-Cr>'] = {},
}

local function is_pair(pair)
  if pair == '  ' then
    return false
  end

  for _, info in pairs(keys) do
    if pair == info.pair then
      return true
    end
  end
  return false
end

local function handler(key, info)
  local line = '_' .. vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1

  local pair = line:sub(col, col + 1)

  if key ~= '<Bs>' and pair:sub(2, 2):find('[%w_]') then
    return key
  end

  if (key == '<Bs>' or key == '<C-h>' or key == '<C-w>') and is_pair(pair) then
    return '<Bs><Del>'
  elseif (key == '<Cr>' or key == '<S-Cr>') and is_pair(pair) then
    return '<Cr><Esc>O'
  elseif info.escape and pair:sub(2, 2) == key then
    return '<C-g>U<Right>'
  elseif info.close then
    -- don't pair spaces
    if key == ' ' and (not is_pair(pair) or pair:sub(1, 1) == pair:sub(2, 2)) then
      return key
    end

    return info.pair .. '<C-g>U<Left>'
  else
    return key
  end
end

for key, info in pairs(keys) do
  map.i(key, function()
    return (key == ' ' and '<C-]>' or '') .. handler(key, info)
  end, true)
end
