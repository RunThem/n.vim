local function hl_cursor_word()
  if vim.api.nvim_get_mode().mode ~= 'n' then
    return
  end

  local bufname = vim.api.nvim_buf_get_name(0)
  if vim.bo.buftype == 'prompt' or #bufname == 0 then
    return
  end

  local column = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  local word = vim.fn.matchstr(line:sub(1, column + 1), [[\k*$]])
    .. vim.fn.matchstr(line:sub(column + 1), [[^\k*]]):sub(2)

  if word == vim.w.word then
    return
  end

  vim.w.word = word
  if vim.w.word_match == 1 then
    vim.fn.matchdelete(vim.w.word_id)
  end

  vim.w.word_match = 0
  if word == '' or #word > 100 or #word < 3 or string.find(word, '[\192-\255]+') ~= nil then
    return
  end

  local pattern = [[\<]] .. word .. [[\>]]
  vim.w.word_id = vim.fn.matchadd('CursorWord', pattern, -1)
  vim.w.word_match = 1
end

local function undo_hl_cursor_word()
  if vim.w.word_id ~= 0 and vim.w.word_id and vim.w.word_match ~= 0 then
    vim.fn.matchdelete(vim.w.word_id)
    vim.w.word_id = nil
    vim.w.word_match = nil
    vim.w.word = nil
  end
end

util.autocmd({ 'CursorMoved', 'CursorMovedI' }, {
  pattern = '*',
  callback = hl_cursor_word,
})

util.autocmd({ 'InsertEnter', 'BufWinEnter' }, {
  pattern = '*',
  callback = undo_hl_cursor_word,
})
