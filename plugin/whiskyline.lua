local api = vim.api
local uv = vim.uv
local co = coroutine
local pd = {}
local whk = { bg = '#202328' }

local function stl_attr(group)
  local color = api.nvim_get_hl_by_name(group, true)
  return { fg = color.foreground }
end

function pd.sk()
  return {
    stl = ' ',
    name = 'sk',
    attr = {
      bg = '#51afef',
      fg = 'NONE',
    },
  }
end

function pd.sep()
  return {
    stl = ' ',
    name = 'sep',
    attr = {
      bg = 'NONE',
      fg = 'NONE',
    },
  }
end

function pd.mode()
  return {
    stl = '',
    name = 'mode',
    event = { 'ModeChanged', 'BufEnter' },
    attr = {
      fn = function()
        local colors = {
          ['n'] = '#ec5f67',
          ['no'] = '#51afef',
          ['v'] = '#51afef',
          ['V'] = '#51afef',
          ['i'] = '#98be65',
          ['\x16'] = '#51afef',
        }

        local mode = api.nvim_get_mode().mode

        return {
          fg = colors[mode] or colors[1],
        }
      end,
    },
  }
end

local function path_sep()
  return uv.os_uname().sysname == 'Windows_NT' and '\\' or '/'
end

function pd.filesize()
  local stl_size = function()
    local size = vim.fn.getfsize(api.nvim_buf_get_name(0))

    if size == 0 or size == -1 or size == -2 then
      return ''
    end

    if size < 1024 then
      size = size .. 'b'
    elseif size < 1024 * 1024 then
      size = string.format('%.1f', size / 1024) .. 'k'
    elseif size < 1024 * 1024 * 1024 then
      size = string.format('%.1f', size / 1024 / 1024) .. 'm'
    else
      size = string.format('%.1f', size / 1024 / 1024 / 1024) .. 'g'
    end
    return size .. ' '
  end

  return {
    stl = stl_size,
    name = 'filesize',
    event = { 'BufEnter' },
    attr = stl_attr('Comment'),
  }
end

function pd.fileinfo()
  local function stl_file()
    local fname = api.nvim_buf_get_name(0)
    local sep = path_sep()
    local parts = vim.split(fname, sep, { trimempty = true })
    local index = #parts - 1 <= 0 and 1 or #parts - 1
    fname = table.concat({ unpack(parts, index) }, sep)
    if #fname == 0 then
      fname = 'UNKNOWN'
    end
    return fname .. '%m'
  end

  return {
    stl = stl_file,
    name = 'fileinfo',
    event = { 'BufEnter' },
    attr = { fg = 'NONE' },
  }
end

function pd.lsp()
  local function lsp_stl(args)
    local msg = ''
    if args.event == 'LspProgress' then
      local val = args.data.params.value

      if val.percentage then
        msg = val.percentage .. '%'

        if val.percentage < 10 then
          msg = msg .. '  '
        elseif val.percentage < 100 then
          msg = msg .. ' '
        else
        end
      end

      if val.kind == 'end' then
        msg = '   '
      end
    elseif args.event == 'LspDetach' then
      msg = '    '
    end

    return '%.40{"' .. msg .. '"}'
  end

  return {
    stl = lsp_stl,
    name = 'Lsp',
    event = { 'LspProgress', 'LspAttach', 'LspDetach' },
    attr = stl_attr('Function'),
  }
end

function pd.pad()
  return {
    stl = '%=',
    name = 'pad',
    attr = {
      bg = 'NONE',
      fg = 'NONE',
    },
  }
end

function pd.lnumcol()
  return {
    stl = '%-4.(%l:%c%) %P',
    name = 'linecol',
    event = { 'CursorHold' },
    attr = stl_attr('Label'),
  }
end

function pd.encoding()
  return {
    stl = '%{&fileencoding?&fileencoding:&encoding} %{&fileformat}',
    name = 'filencode',
    event = { 'BufEnter' },
    attr = stl_attr('Type'),
  }
end

local function get_diag_sign(type)
  local prefix = 'DiagnosticSign'
  for _, item in ipairs(vim.fn.sign_getdefined()) do
    if item.name == prefix .. type then
      return item.text
    end
  end
end

function pd.diag()
  local i
  local count
  local tbl = { 'Error', 'Warn', 'Info', 'Hint' }

  local function diag_has()
    for i = 1, 4 do
      local count = #vim.diagnostic.get(0, { severity = i })
      if count ~= 0 then
        return i
      end
    end

    return 0
  end

  local function diag_stl()
    if vim.diagnostic.is_disabled(0) then
      return '  '
    end

    local tbl = { 'Error', 'Warn', 'Info', 'Hint' }
    local idx = diag_has()

    return idx == 0 and '  ' or get_diag_sign(tbl[idx])
  end

  local function diag_attr()
    if vim.diagnostic.is_disabled(0) then
      return '  '
    end

    local tbl = { 'DiagnosticError', 'DiagnosticWarn', 'DiagnosticInfo', 'DiagnosticHint' }
    local idx = diag_has()

    if idx == 0 then
      return { fg = 'NONE' }
    end

    return stl_attr(tbl[idx])
  end

  return {
    stl = diag_stl,
    name = 'diag',
    event = { 'DiagnosticChanged', 'BufEnter' },
    attr = { fn = diag_attr },
  }
end

local S = pd.sep
local funs = {
  pd.sk,
  S,

  S,
  pd.mode,
  S,

  S,
  pd.lsp,
  S,

  S,
  pd.diag,
  S,

  S,
  pd.filesize,
  pd.fileinfo,
  S,

  pd.pad,

  S,
  pd.lnumcol,
  S,

  S,
  pd.encoding,
  S,

  S,
  pd.sk,
}

local function stl_format(name, val)
  return '%#Whisky' .. name .. '#' .. val .. '%*'
end

local function stl_hl(name, attr)
  if attr.fn then
    attr = attr.fn()
  end

  if name ~= 'sk' then
    attr.bg = whk.bg
  end

  api.nvim_set_hl(0, 'Whisky' .. name, attr)
end

local function default()
  local comps, events, pieces = {}, {}, {}

  for idx, fun in ipairs(funs) do
    local item = fun()

    comps[idx] = item
    pieces[idx] = type(item.stl) == 'string' and stl_format(item.name, item.stl) or ''

    if type(item.stl) == 'function' or item.attr['fn'] then
      for _, event in ipairs(item.event or {}) do
        if not events[event] then
          events[event] = {}
        end

        table.insert(events[event], idx)
      end
    end

    stl_hl(item.name, item.attr)
  end

  return comps, events, pieces
end

local function render(comps, events, pieces)
  return co.create(function(args)
    while true do
      local event = args.event

      for _, idx in ipairs(events[event]) do
        if type(comps[idx].stl) == 'function' then
          pieces[idx] = stl_format(comps[idx].name, comps[idx].stl(args))
        end

        if comps[idx].attr['fn'] then
          stl_hl(comps[idx].name, comps[idx].attr)
        end
      end

      vim.opt.stl = table.concat(pieces)
      args = co.yield()
    end
  end)
end

local comps, events, pieces = default()
local stl_render = render(comps, events, pieces)

for _, event in ipairs(vim.tbl_keys(events)) do
  api.nvim_create_autocmd(event, {
    callback = function(args)
      vim.schedule(function()
        local ok, res = co.resume(stl_render, args)
        if not ok then
          vim.notify('[Whisky] render failed ' .. res, vim.log.levels.ERROR)
        end
      end)
    end,
  })
end
