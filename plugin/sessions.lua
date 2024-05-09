local function session_filepath()
  local path = vim.fn.getcwd(0)
  return string.format(util.data_path() .. '/sessions/%s.session', vim.base64.encode(path))
end

local function load_sessions()
  local file = session_filepath()

  if vim.uv.fs_stat(file) then
    vim.cmd(string.format('silent! source %s', file))
  end
end

local function save_sessions()
  local file = session_filepath()
  vim.cmd(string.format('mksession! %s', file))
end

autocmd('VimLeavePre', {
  callback = function()
    save_sessions()
  end,
})

autocmd('VimEnter', {
  callback = function(opt)
    if opt.file == '' then
      vim.defer_fn(load_sessions, 20)
    end
  end,
})
