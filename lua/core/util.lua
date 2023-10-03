-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local util = {}
local opts = {}

--- Path
local home_path = os.getenv('HOME')
util.path_sep = package.config:sub(1, 1) == '\\' and '\\' or '/'

function util.conf_path()
  local config = os.getenv('XDG_CONFIG_DIR')
  if not config then
    return home_path .. '/.config/nvim'
  end
  return config
end

function util.data_path()
  local data = os.getenv('XDG_DATA_DIR')
  if not data then
    return home_path .. '/.local/share/nvim'
  end
  return data
end

--- Debug
function util.info(b)
  local msg
  if type(b) == 'table' then
    msg = vim.inspect(b)
  elseif type(b) == 'string' then
    msg = "'" .. b .. "'"
  else
    msg = tostring(b)
  end

  vim.api.nvim_err_writeln(msg)
end

--- Api
function util.col()
  return vim.api.nvim_win_get_cursor(0)[2]
end

function util.row()
  return vim.api.nvim_win_get_cursor(0)[1]
end

function util.height()
  return vim.api.nvim_win_get_height(0)
end

function util.width()
  return vim.api.nvim_win_get_width(0)
end

function util.line(line)
  return vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
end

function util.cur_line()
  return vim.api.nvim_get_current_line()
end

--- Keymap
function opts:new(instance)
  instance = instance
    or {
      options = {
        silent = false,
        nowait = false,
        expr = false,
        noremap = false,
      },
    }
  setmetatable(instance, self)
  self.__index = self
  return instance
end

function util.silent(opt)
  return function()
    opt.silent = true
  end
end

function util.noremap(opt)
  return function()
    opt.noremap = true
  end
end

function util.expr(opt)
  return function()
    opt.expr = true
  end
end

function util.remap(opt)
  return function()
    opt.remap = true
  end
end

function util.nowait(opt)
  return function()
    opt.nowait = true
  end
end

function util.new_opts(...)
  local args = { ... }
  local o = opts:new()

  if #args == 0 then
    return o.options
  end

  for _, arg in pairs(args) do
    if type(arg) == 'string' then
      o.options.desc = arg
    else
      arg(o.options)()
    end
  end
  return o.options
end

function util.cmd(str)
  return '<cmd>' .. str .. '<CR>'
end

-- visual
function util.cu(str)
  return '<C-u><cmd>' .. str .. '<CR>'
end

--@private
local keymap_set = function(mode, tbl)
  vim.validate({
    tbl = { tbl, 'table' },
  })
  local len = #tbl
  if len < 2 then
    vim.notify('keymap must has rhs')
    return
  end

  local options = len == 3 and tbl[3] or util.new_opts()

  vim.keymap.set(mode, tbl[1], tbl[2], options)
end

local function map(mod)
  return function(tbl)
    vim.validate({
      tbl = { tbl, 'table' },
    })

    if type(tbl[1]) == 'table' and type(tbl[2]) == 'table' then
      for _, v in pairs(tbl) do
        keymap_set(mod, v)
      end
    else
      keymap_set(mod, tbl)
    end
  end
end

util.nmap = map('n')
util.imap = map('i')
util.cmap = map('c')
util.vmap = map('v')
util.xmap = map('x')
util.tmap = map('t')
util.smap = map('s')

return util
