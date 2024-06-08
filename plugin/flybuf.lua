local winid = nil

local function fname_path(buf)
  local sep = vim.loop.os_uname().version:match('Windows') and '\\' or '/'
  if vim.fn.has('shellslash') == 1 then
    sep = '\\'
  end

  local fname = vim.api.nvim_buf_get_name(buf)
  if fname == '' then
    return '[No Name]'
  end

  local parts = vim.split(fname, sep)
  return table.concat(parts, sep, #parts - 1, #parts)
end

local function get_buffers()
  local bufnrs = vim.tbl_filter(function(buf)
    return vim.bo[buf].buflisted
  end, vim.api.nvim_list_bufs())

  table.sort(bufnrs, function(a, b)
    return vim.fn.getbufinfo(a)[1].lastused > vim.fn.getbufinfo(b)[1].lastused
  end)

  local bufs = {}

  for _, bufnr in ipairs(bufnrs) do
    local flag = bufnr == vim.fn.bufnr('') and '%' or (bufnr == vim.fn.bufnr('#') and '#' or ' ')

    local element = {
      bufnr = bufnr,
      flag = flag,
      name = fname_path(bufnr),
    }

    if flag == '#' or flag == '%' then
      local idx = ((bufs[1] ~= nil and bufs[1].flag == '%') and 2 or 1)
      table.insert(bufs, idx, element)
    else
      table.insert(bufs, element)
    end
  end

  return bufs
end

local function align_element(content)
  local max = {}
  for _, item in ipairs(content) do
    max[#max + 1] = #item
  end

  table.sort(max)
  max = max[#max]

  local res = {}
  for _, item in ipairs(content) do
    local fill = (' '):rep(max - #item)
    res[#res + 1] = item .. fill
  end

  return res
end

local function hotkey(key)
  local tbl = {}
  key:gsub('.', function(c)
    tbl[#tbl + 1] = c
  end)

  local index = 1
  return function()
    index = index + 1
    if index > #tbl then
      vim.notify('[FlyBuf] index is out of range')
      return index - 1
    end
    return tbl[index - 1]
  end
end

local function max_content_width(content)
  local max = {}
  for _, item in ipairs(content) do
    max[#max + 1] = #item
  end

  table.sort(max)

  return max[#max]
end

local function create_ns()
  local name = 'FlyBuf'

  local all = vim.api.nvim_get_namespaces()
  if not all[name] then
    return vim.api.nvim_create_namespace(name)
  end

  return all[name]
end

local function max_buf_len(bufs)
  local max = {}

  for _, item in pairs(bufs) do
    max[#max + 1] = #tostring(item.bufnr)
  end

  table.sort(max)

  return max[#max]
end

local function flattern_tbl(tbl, idxs)
  local tmp = {}

  for k, v in ipairs(tbl) do
    if not vim.tbl_contains(idxs, k) then
      tmp[#tmp + 1] = v
    end
  end

  return tmp
end

local function create_menu(opt)
  local bufs = get_buffers()
  if #bufs == 0 then
    return
  end

  local lines = {}
  local hi = {}
  local shortcut = hotkey(opt.hotkey)
  local keys = {}
  local ns = create_ns()
  local max_len = max_buf_len(bufs)

  for i, item in ipairs(bufs) do
    local key = shortcut()
    if #item.name ~= 0 then
      lines[#lines + 1] = ' [' .. key .. '] ' .. item.name
      hi[#hi + 1] = {
        { 1, 2, 'Comment' },
        { 2, 3, '@variable.builtin' },
        { 3, 4, 'Comment' },
        { 5, #item.name + 5, 'Normal' },
      }

      -- table.insert(hi[#hi], nil)
      keys[#keys + 1] = { key, i }
    end
  end

  if #lines == 0 then
    return
  end

  lines = align_element(lines)
  local line_width = max_content_width(lines)

  local float_opt = {
    relative = 'editor',
    width = line_width < 40 and 40 or line_width,
    row = math.floor(vim.o.lines * 0.2),
    border = opt.border,
    style = 'minimal',
  }

  float_opt.col = math.floor(vim.o.columns * 0.5) - math.floor(float_opt.width * 0.5)

  local max_height = math.floor(vim.o.lines * 0.6)
  float_opt.height = #lines > max_height and max_height or #lines

  local bufnr = vim.api.nvim_create_buf(false, false)
  vim.bo[bufnr].bufhidden = 'wipe'
  vim.bo[bufnr].buftype = 'nofile'

  local winid = vim.api.nvim_open_win(bufnr, true, float_opt)
  vim.api.nvim_win_set_hl_ns(winid, ns)
  vim.api.nvim_set_option_value('winhl', 'Normal:Normal,FloatBorder:Constant', {
    scope = 'local',
    win = winid,
  })

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
  vim.bo[bufnr].modifiable = false

  local function gen_highlight()
    for i, item in ipairs(hi) do
      for _, v in ipairs(item) do
        vim.api.nvim_buf_add_highlight(bufnr, ns, v[3], i - 1, v[1], v[2])
      end
    end
  end

  gen_highlight()

  for _, item in ipairs(keys) do
    vim.api.nvim_buf_set_keymap(bufnr, 'n', item[1], '', {
      noremap = true,
      nowait = true,
      callback = function()
        local buf = bufs[item[2]].bufnr
        vim.api.nvim_win_close(winid, true)
        vim.api.nvim_win_set_buf(0, buf)
      end,
    })
  end

  local wipes = {}
  vim.api.nvim_buf_set_keymap(bufnr, 'n', opt.mark, '', {
    noremap = true,
    nowait = true,
    callback = function()
      local index = vim.api.nvim_win_get_cursor(winid)[1]
      local start, _end = unpack(hi[index][4])
      if not vim.tbl_contains(vim.tbl_keys(wipes), index) then
        local id = vim.api.nvim_buf_set_extmark(bufnr, ns, index - 1, start, {
          end_col = _end,
          hl_group = 'Type',
        })
        wipes[index] = id
      else
        local id = wipes[index]
        vim.api.nvim_buf_del_extmark(bufnr, ns, id)
        vim.api.nvim_buf_set_extmark(bufnr, ns, index - 1, start, {
          end_col = _end,
          hl_group = 'Normal',
        })
        wipes[index] = nil
      end
    end,
  })

  --delele buffers by mark
  vim.api.nvim_buf_set_keymap(bufnr, 'n', opt.delete, '', {
    noremap = true,
    nowait = true,
    callback = function()
      local content = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
      if not wipes or #wipes == 0 then
        local row = vim.api.nvim_win_get_cursor(winid)[1]
        wipes[row] = true
      end

      for index, _ in pairs(wipes or {}) do
        vim.api.nvim_buf_call(bufs[index].bufnr, function()
          vim.api.nvim_buf_delete(bufs[index].bufnr, { force = true })
        end)
        table.remove(content, index)
        table.remove(hi, index)
      end

      local indexs = vim.tbl_keys(wipes)
      bufs = flattern_tbl(bufs, indexs)
      content = flattern_tbl(content, indexs)
      hi = flattern_tbl(hi, indexs)

      wipes = {}
      vim.bo[bufnr].modifiable = true
      if #content == 0 then
        vim.api.nvim_win_close(winid, true)
      else
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, content)
        vim.bo[bufnr].modifiable = false
        gen_highlight()
        vim.api.nvim_win_set_config(winid, { height = #content })
      end
    end,
  })

  vim.api.nvim_buf_set_keymap(bufnr, 'n', opt.quit, '', {
    noremap = true,
    nowait = true,
    callback = function()
      vim.api.nvim_win_close(winid, true)
    end,
  })

  vim.api.nvim_create_autocmd({ 'CursorMoved' }, {
    buffer = bufnr,
    callback = function()
      local pos = vim.api.nvim_win_get_cursor(winid)
      vim.api.nvim_win_set_cursor(winid, { pos[1], 2 })
    end,
  })

  vim.api.nvim_create_autocmd({ 'BufDelete' }, {
    buffer = bufnr,
    callback = function()
      vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
    end,
  })

  return winid
end

map.n('gb', function()
  if winid and vim.api.nvim_win_is_valid(winid) then
    vim.api.nvim_win_close(winid, true)
    winid = nil
    return
  end

  winid = create_menu({
    hotkey = 'asdfghwertyuiopzcvbnm',
    border = 'single',
    quit = 'q',
    mark = 'l',
    delete = 'x',
  })
end)
