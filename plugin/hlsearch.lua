local fn = vim.fn
local api = vim.api

local function stop_hl()
  if vim.v.hlsearch == 0 then
    return
  end

  local keycode = api.nvim_replace_termcodes('<Cmd>nohl<Cr>', true, false, true)
  api.nvim_feedkeys(keycode, 'n', false)
end

local function start_hl()
  if vim.v.hlsearch ~= 1 then
    return
  end

  local res = fn.getreg('/')

  if res:find([[%#]], 1, true) then
    stop_hl()
    return
  end

  ok, res = pcall(fn.search, [[\%#\zs]] .. res, 'cnW')
  if ok and res == 0 then
    stop_hl()
    return
  end
end

local buffers = {}

local function hlsearch(bufnr)
  if buffers[bufnr] then
    return
  end
  buffers[bufnr] = true

  local cm_id = autocmd({ 'CursorMoved' }, {
    buffer = bufnr,
    callback = function()
      start_hl()
    end,
  })

  local cm_id = autocmd({ 'InsertEnter' }, {
    buffer = bufnr,
    callback = function()
      stop_hl()
    end,
  })

  autocmd({ 'BufDelete' }, {
    buffer = bufnr,
    callback = function(opt)
      buffers[bufnr] = nil
      pcall(api.nvim_del_autocmd, cm_id)
      pcall(api.nvim_del_autocmd, ie_id)
      pcall(api.nvim_del_autocmd, opt.id)
    end,
  })
end

autocmd({ 'BufWinEnter' }, {
  callback = function(opt)
    hlsearch(opt.buf)
  end,
})
