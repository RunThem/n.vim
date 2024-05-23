local buffers = {}

local function stop_hl()
  if vim.v.hlsearch == 0 then
    return
  end

  local keycode = vim.api.nvim_replace_termcodes('<Cmd>nohl<Cr>', true, false, true)
  vim.api.nvim_feedkeys(keycode, 'n', false)
end

local function start_hl()
  if vim.v.hlsearch ~= 1 then
    return
  end

  local res = vim.fn.getreg('/')

  if res:find([[%#]], 1, true) then
    stop_hl()
    return
  end

  ok, res = pcall(vim.fn.search, [[\%#\zs]] .. res, 'cnW')
  if ok and res == 0 then
    stop_hl()
    return
  end
end

local function hl_search(bufnr)
  if buffers[bufnr] then
    return
  end
  buffers[bufnr] = true

  local start_cmd_id = util.autocmd({ 'CursorMoved' }, {
    buffer = bufnr,
    callback = function()
      start_hl()
    end,
  })

  local stop_cmd_id = util.autocmd({ 'InsertEnter' }, {
    buffer = bufnr,
    callback = function()
      stop_hl()
    end,
  })

  util.autocmd({ 'BufDelete' }, {
    buffer = bufnr,
    callback = function(opt)
      buffers[bufnr] = nil
      pcall(vim.api.nvim_del_autocmd, start_cmd_id)
      pcall(vim.api.nvim_del_autocmd, stop_cmd_id)
      pcall(vim.api.nvim_del_autocmd, opt.id)
    end,
  })
end

util.autocmd({ 'BufWinEnter' }, {
  callback = function(opt)
    hl_search(opt.buf)
  end,
})
