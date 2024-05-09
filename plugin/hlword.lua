local cmd = vim.cmd
local fn = vim.fn
local hl = vim.api.nvim_set_hl

local colors = {
  { color = '#ff7272', use = false },
  { color = '#10fea1', use = false },
  { color = '#a4f225', use = false },
  { color = '#13cbea', use = false },
  { color = '#ffcb72', use = false },
  { color = '#ff93ff', use = false },
  { color = '#9999ff', use = false },
  { color = '#6cfdfe', use = false },
}

local maps = {
  -- { word, idx }
}

local function unhl_word(i)
  colors[maps[i].idx].use = false
  hl(0, 'hl_words_' .. maps[i].word, {})

  table.remove(maps, i)
end

local function unhl_all()
  while #maps ~= 0 do
    unhl_word(1)
  end
end

local function get_idx()
  if #maps == #colors then
    local idx = maps[1].idx
    unhl_word(1)

    return idx
  else
    for i = 1, #colors do
      if colors[i].use == false then
        return i
      end
    end
  end
end

local function hl_word()
  local idx = 0
  local word = fn.expand('<cword>')
  local hl_group = 'hl_words_' .. word

  for i = 1, #maps do
    if maps[i].word == word then
      unhl_word(i)

      return
    end
  end

  idx = get_idx()

  hl(0, hl_group, { bg = colors[idx].color, fg = 'Black' })

  for i = 1, fn.winnr('$') do
    fn.matchadd(hl_group, string.format([[\<%s\>]], word), 11, -1, { window = fn.win_getid(i) })
  end

  colors[idx].use = true
  table.insert(maps, { word = word, idx = idx })
end

map.n('<Leader>m', hl_word, { expr = false })
map.n('<Leader>c', unhl_all, { expr = false })
