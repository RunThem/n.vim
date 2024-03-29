local fn = vim.fn
local api = vim.api

local lp = {
  ['bt'] = { 'quickfix', 'nofile', 'help' },
  ['ft'] = { 'gitcommit', 'gitrebase', 'svn', 'hgcommit' },
}

local function set_cursor_position()
  local last_line = fn.line([['"]])
  local buff_last_line = fn.line('$')
  local window_last_line = fn.line('w$')
  local window_first_line = fn.line('w0')

  if last_line > 0 and last_line <= buff_last_line then
    if window_last_line == buff_last_line then
      api.nvim_command([[normal! g`"]])
    elseif buff_last_line - last_line > ((window_last_line - window_first_line) / 2) - 1 then
      api.nvim_command([[normal! g`"zz]])
    else
      api.nvim_command([[normal! G'"<c-e>]])
    end
  end

  if fn.foldclosed('.') ~= -1 and lp.lastplace_open_folds == 1 then
    api.nvim_command([[normal! zvzz]])
  end
end

local function lastplace_buf()
  local get_opt = api.nvim_get_option_value

  if vim.tbl_contains(lp.bt, get_opt('buftype', {})) or vim.tbl_contains(lp.ft, get_opt('filetype', {})) then
    return
  end

  if fn.line('.') > 1 then
    return
  end

  set_cursor_position()
end

autocmd('BufWinEnter', { callback = lastplace_buf })
autocmd('FileType', { callback = lastplace_buf })
