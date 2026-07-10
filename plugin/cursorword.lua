local w, fn, api = vim.w, vim.fn, vim.api

local function hl_cursor_word()
  if api.nvim_get_mode().mode ~= 'n' then
    return
  end

  local bufname = api.nvim_buf_get_name(0)
  if vim.bo.buftype == 'prompt' or #bufname == 0 then
    return
  end

  local column = api.nvim_win_get_cursor(0)[2]
  local line = api.nvim_get_current_line()
  local word = fn.matchstr(line:sub(1, column + 1), [[\k*$]]) .. fn.matchstr(line:sub(column + 1), [[^\k*]]):sub(2)

  if word == w.word then
    return
  end

  w.word = word
  if w.word_match == 1 then
    fn.matchdelete(w.word_id)
  end

  w.word_match = 0
  if word == '' or #word > 100 or #word < 3 or string.find(word, '[\192-\255]+') ~= nil then
    return
  end

  local pattern = [[\<]] .. word .. [[\>]]
  w.word_id = fn.matchadd('CursorWord', pattern, -1)
  w.word_match = 1
end

local function undo_hl_cursor_word()
  if w.word_id ~= 0 and w.word_id and w.word_match ~= 0 then
    fn.matchdelete(w.word_id)
    w.word_id = nil
    w.word_match = nil
    w.word = nil
  end
end

util.autocmd({ 'CursorMoved' }, {
  pattern = '*',
  callback = hl_cursor_word,
})

util.autocmd({ 'InsertEnter', 'BufWinEnter' }, {
  pattern = '*',
  callback = undo_hl_cursor_word,
})
