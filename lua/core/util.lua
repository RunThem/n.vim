---[[ info ]]
author = io.popen('git config user.name'):read('*l')
email = io.popen('git config user.email'):read('*l')

---[[ group ]]
group = vim.api.nvim_create_augroup('n.vim', {})
autocmd = function(event, opt)
  opt = vim.tbl_deep_extend('force', { group = group }, opt)
  return vim.api.nvim_create_autocmd(event, opt)
end

---[[ utils function ]]
util = {}

---@return string
function util.conf_path()
  local config = os.getenv('XDG_CONFIG_DIR')
  if not config then
    return os.getenv('HOME') .. '/.config/nvim'
  end
  return config
end

---@return string
function util.data_path()
  local data = os.getenv('XDG_DATA_DIR')
  if not data then
    return os.getenv('HOME') .. '/.local/share/nvim'
  end

  return data
end

---@return integer
function util.col()
  return vim.api.nvim_win_get_cursor(0)[2]
end

---@return integer
function util.row()
  return vim.api.nvim_win_get_cursor(0)[1]
end

---@return integer
function util.height()
  return vim.api.nvim_win_get_height(0)
end

---@return integer
function util.width()
  return vim.api.nvim_win_get_width(0)
end

---@param line integer
---@return integer
function util.line(line)
  return vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
end

---@return integer
function util.cline()
  return vim.api.nvim_get_current_line()
end

---@return integer
function util.bufnr()
  return vim.api.nvim_get_current_buf()
end

---@param coord table
---@param msg string|table
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

---@param msg string|table
function util.cwrite(msg)
  local bufnr = util.bufnr()
  local row = util.row() - 1
  local col = util.col()

  if type(msg) == 'string' then
    msg = { msg }
  end

  vim.api.nvim_buf_set_text(bufnr, row, col, row, col, msg)
end

---[[ keymap function ]]
map = {}

---@param c string
---@return string
function map.cmd(c)
  return '<cmd>' .. c .. '<Cr>'
end

for _, m in pairs({ 'n', 'i', 'c', 'v', 'x', 't', 's' }) do
  ---@param key string
  ---@param expr string|function
  map[m] = function(key, expr)
    local opt = {}
    if type(expr) == 'string' then
      opt = { noremap = true, nowait = true, silent = true }
    else
      opt = { noremap = true, nowait = true, silent = true, expr = true }
    end

    vim.keymap.set(m, key, expr, opt)
  end
end
