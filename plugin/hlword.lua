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

local function get_idx()
  if #maps == #colors then
    local idx = maps[1].idx
    undo_hl_word(1)

    return idx
  else
    for i = 1, #colors do
      if colors[i].use == false then
        return i
      end
    end
  end
end

local function undo_hl_word(i)
  colors[maps[i].idx].use = false
  vim.api.nvim_set_hl(0, 'hl_word_' .. maps[i].word, {})

  table.remove(maps, i)
end

local function undo_hl_all_word()
  while #maps ~= 0 do
    undo_hl_word(1)
  end
end

local function hl_word(word)
  local idx = 0
  local word = word or vim.fn.expand('<cword>')
  local hl_group = 'hl_word_' .. word

  for i = 1, #maps do
    if maps[i].word == word then
      undo_hl_word(i)

      return
    end
  end

  idx = get_idx()

  vim.api.nvim_set_hl(0, hl_group, { bg = colors[idx].color, fg = 'Black' })

  for i = 1, vim.fn.winnr('$') do
    vim.fn.matchadd(hl_group, string.format([[\<%s\>]], word), 11, -1, { window = vim.fn.win_getid(i) })
  end

  colors[idx].use = true
  table.insert(maps, { word = word, idx = idx })
end

map.n('<Leader>m', hl_word)

map.n('<Leader>c', undo_hl_all_word)
