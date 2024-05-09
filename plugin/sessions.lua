local sessions_path = util.data_path() .. '/sessions'

local function session_file()
  local path = vim.fn.getcwd(0)
  return string.format('%s/%s.session', sessions_path, vim.base64.encode(path))
end

if not vim.uv.fs_stat(sessions_path) then
  vim.uv.fs_mkdir(sessions_path, 493)
end

autocmd('VimLeavePre', {
  callback = function()
    local file = session_file()
    vim.cmd(string.format('mksession! %s', file))
  end,
})

autocmd('VimEnter', {
  callback = function(opt)
    if opt.file == '' then
      vim.defer_fn(function()
        local file = session_file()

        if vim.uv.fs_stat(file) then
          vim.cmd(string.format('silent! source %s', file))
        end
      end, 20)
    end
  end,
})
