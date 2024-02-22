local api, fn, w = vim.api, vim.fn, vim.w

local function matchadd()
  local bufname = api.nvim_buf_get_name(0)
  if vim.bo.buftype == 'prompt' or #bufname == 0 then
    return
  end

  if api.nvim_get_mode().mode == 'i' then
    return
  end

  local column = api.nvim_win_get_cursor(0)[2]
  local line = api.nvim_get_current_line()
  local cursorword = fn.matchstr(line:sub(1, column + 1), [[\k*$]])
    .. fn.matchstr(line:sub(column + 1), [[^\k*]]):sub(2)

  if cursorword == w.cursorword then
    return
  end

  w.cursorword = cursorword
  if w.cursorword_match == 1 then
    vim.call('matchdelete', w.cursorword_id)
  end

  w.cursorword_match = 0
  if cursorword == '' or #cursorword > 100 or #cursorword < 3 or string.find(cursorword, '[\192-\255]+') ~= nil then
    return
  end

  local pattern = [[\<]] .. cursorword .. [[\>]]
  w.cursorword_id = fn.matchadd('CursorWord', pattern, -1)
  w.cursorword_match = 1
end

local function cursor_moved()
  if api.nvim_get_mode().mode == 'n' then
    matchadd()
  end
end

local function disable_cursorword()
  if w.cursorword_id ~= 0 and w.cursorword_id and w.cursorword_match ~= 0 then
    fn.matchdelete(w.cursorword_id)
    w.cursorword_id = nil
    w.cursorword_match = nil
    w.cursorword = nil
  end
end

autocmd({ 'CursorMoved', 'CursorMovedI' }, {
  pattern = '*',
  callback = cursor_moved,
})

autocmd({ 'InsertEnter', 'BufWinEnter' }, {
  pattern = '*',
  callback = disable_cursorword,
})
