-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local util = {}

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

function util.cline()
  return vim.api.nvim_get_current_line()
end

function util.bufnr()
  return vim.api.nvim_get_current_buf()
end

function util.write(coord, msg)
  local bufnr = util.bufnr()

  if type(coord) ~= 'table' then
    return
  end

  local s_row, s_col, e_row, e_col
  if #coord == 2 then
    s_row, s_col, e_row, e_col = coord[1] - 1, coord[2], coord[1] - 1, coord[2]
  elseif #coord == 4 then
    s_row, s_col, e_row, e_col = coord[1] - 1, coord[2], coord[3] - 1, coord[4]
  end

  if type(msg) == 'string' then
    msg = { msg }
  end

  vim.api.nvim_buf_set_text(bufnr, s_row, s_col, e_row, e_col, msg)
end

function util.cwrite(msg)
  local bufnr = util.bufnr()
  local row = util.row() - 1
  local col = util.col()

  if type(msg) == 'string' then
    msg = { msg }
  end

  vim.api.nvim_buf_set_text(bufnr, row, col, row, col, msg)
end

--- Keymap
local map = {}

function map.cmd(c)
  return '<cmd>' .. c .. '<Cr>'
end

for _, m in pairs({ 'n', 'i', 'c', 'v', 'x', 't', 's' }) do
  map[m] = function(key, expr, opt)
    if opt == nil then
      opt = { noremap = true, nowait = true, silent = true }
    else
      vim.validate({ opt = { opt, 'table' } })
    end

    vim.keymap.set(m, key, expr, opt)
  end
end

util.map = map

return util
