-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local util = {}
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

return util
