local M = {}

local cmd = vim.cmd
local fn = vim.fn
local key = vim.keymap

local colors = {
  { color = '#ff7272', use = false },
  { color = '#80fee1', use = false },
  { color = '#a4f225', use = false },
  { color = '#13cbea', use = false },
  { color = '#ffcb72', use = false },
  { color = '#ff93ff', use = false },
  { color = '#9999ff', use = false },
  { color = '#bcfdfe', use = false },
}

local maps = {
  -- { word, idx }
}

function M.unhl_word(i)
  colors[maps[i].idx].use = false
  cmd(string.format('highlight clear %s', 'hl_words_' .. maps[i].word))
  table.remove(maps, i)
end

function M.unhl_all()
  while #maps ~= 0 do
    M.unhl_word(1)
  end
end

function get_idx()
  if #maps == #colors then
    local idx = maps[1].idx
    M.unhl_word(1)

    return idx
  else
    for i = 1, #colors do
      if colors[i].use == false then
        return i
      end
    end
  end
end

function M.hl_word()
  local idx = 0
  local word = fn.expand('<cword>')
  local hl_group = 'hl_words_' .. word

  for i = 1, #maps do
    if maps[i].word == word then
      M.unhl_word(i)

      return
    end
  end

  idx = get_idx()

  cmd(string.format('highlight %s guibg=%s guifg=Black', hl_group, colors[idx].color))

  for i = 1, fn.winnr('$') do
    fn.matchadd(hl_group, string.format([[\<%s\>]], word), 11, -1, { window = fn.win_getid(i) })
  end

  colors[idx].use = true
  table.insert(maps, { word = word, idx = idx })
end

key.set('n', '<Leader>m', M.hl_word, { desc = 'highlight/unhighlight word' })
key.set('n', '<Leader>c', M.unhl_all, { desc = 'unhighlight all word' })

return M
