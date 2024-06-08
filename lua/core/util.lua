--- [[ utils ]]
util = {
  ---@type string
  author = io.popen('git config user.name'):read('*l'),

  ---@type string
  email = io.popen('git config user.email'):read('*l'),
}

---@param event string|table<string>
---@param opts vim.api.keyset.create_autocmd
---@return integer
function util.autocmd(event, opts)
  return vim.api.nvim_create_autocmd(event, opts)
end

---@param file string
---@return string
function util.confpath(file)
  local path = os.getenv('XDG_CONFIG_DIR')
  if not path then
    path = os.getenv('HOME') .. '/.config/nvim'
  end

  return path .. (file and '/' .. file or '')
end

---@param file string
---@return string
function util.datapath(file)
  local path = os.getenv('XDG_DATA_DIR')
  if not path then
    path = os.getenv('HOME') .. '/.local/share/nvim'
  end

  return path .. (file and '/' .. file or '')
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
---@return string[]
function util.line(line)
  return vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
end

---@return string
function util.cline()
  return vim.api.nvim_get_current_line()
end

---@return integer
function util.bufnr()
  return vim.api.nvim_get_current_buf()
end

---@param coord table<integer>
---@param msg string|table<string>
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

---@param msg string|table<string>
function util.cwrite(msg)
  local bufnr = util.bufnr()
  local row = util.row() - 1
  local col = util.col()

  if type(msg) == 'string' then
    msg = { msg }
  end

  vim.api.nvim_buf_set_text(bufnr, row, col, row, col, msg)
end

--- [[ keymap function ]]
map = {}

for _, mode in pairs({ 'n', 'i', 'c', 'v', 'x', 't', 's' }) do
  ---@param key string
  ---@param expr string|function
  ---@param opt table|nil
  map[mode] = function(key, expr, opt)
    opt = vim.tbl_deep_extend('force', { noremap = true, nowait = true, silent = true }, opt or {})

    if type(expr) == 'string' then
      if expr:sub(1, 1) == ':' then
        expr = '<Cmd>' .. expr:sub(2) .. '<Cr>'
      end
    end

    vim.keymap.set(mode, key, expr, opt)
  end
end
