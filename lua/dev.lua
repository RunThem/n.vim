local M = {}

local api, fn, ts, lpeg = vim.api, vim.fn, vim.treesitter, vim.lpeg
local inf = vim.print

local M = {}
M.__index = M

-- 创建一个新的 complete 对象
function M.new(items)
  local self = setmetatable({}, M)

  local height = 0
  for _, item in ipairs(items) do
    if item:len() > height then
      height = item:len()
    end
  end

  self.width = math.max(15, height)
  self.height = math.min(5, #items)

  local opts = {
    style = 'minimal',
    relative = 'cursor',
    border = 'rounded',
    width = self.width,
    height = self.height,
    row = 1,
    col = -1,
  }

  self.enable = true
  self.items = {}
  self.count = 0
  self.line = 0
  self.parent = vim.api.nvim_get_current_win()
  self.buf = vim.api.nvim_create_buf(false, true)
  self.win = vim.api.nvim_open_win(self.buf, true, opts)
  self.ns_id = vim.api.nvim_create_namespace('M.ns')
  self.extmark = -1
  -- scrolloff

  vim.api.nvim_win_set_option(self.win, 'scrolloff', 0)

  self:update(items)
  self:move(1)

  return self
end

---@generic T
---@param items table<T>
function M:update(items)
  if not self.enable then
    return
  end

  self.items = items
  self.count = #items

  for i, item in ipairs(items) do
    items[i] = item .. (' '):rep(self.width - item:len())
  end

  vim.api.nvim_buf_set_lines(self.buf, 0, -1, false, items)
  vim.api.nvim_set_current_win(self.parent)
end

function M:move(idx)
  if not self.enable then
    return
  end

  if idx == 1 then
    self.line = (self.line == self.count) and 1 or self.line + 1
  else
    self.line = (self.line == 1) and self.count or self.line - 1
  end

  if self.extmark ~= -1 then
    vim.api.nvim_buf_del_extmark(self.buf, self.ns_id, self.extmark)
  end

  self.extmark = vim.api.nvim_buf_set_extmark(self.buf, self.ns_id, self.line - 1, 0, {
    end_line = self.line,
    hl_group = 'PmenuSel',
  })

  vim.api.nvim_win_set_cursor(self.win, { self.line, 0 })
  vim.api.nvim_set_current_win(self.parent)
end

---@return string
function M:enter()
  if not self.enable then
    return
  end

  if #self.items == 0 then
    return nil
  end

  local selected = self.items[self.line + 1]

  vim.api.nvim_win_close(self.win, true)
  vim.api.nvim_buf_delete(self.buf, { force = true })

  self.enable = false

  return selected
end

local epo = nil
local items = { 'prefix', 'start', 'selected', 'epo', 'args', 'items', 'setup' }

function M.setup()
  inf('Hello Neovim!!!')

  -- map.i('c', function()
  --   vim.fn.complete(util.col(), { 'hello' })
  -- end)

  -- util.autocmd({ 'TextChangedI' }, {
  --   callback = function(args)
  --     local line = util.cline()
  --     local col = util.col()
  --     if col == 0 or #line == 0 then
  --       return
  --     end
  --
  --     local prefix, start = unpack(vim.fn.matchstrpos(line:sub(1, col), [[\k*$]]))
  --     if prefix == '' then
  --       prefix = line:sub(col, col + 1)
  --     end
  --
  --     if prefix ~= '/' then
  --       return
  --     end
  --
  --     if epo == nil then
  --       epo = M.new(items)
  --     end
  --
  --     vim.print({ prefix, start })
  --   end,
  -- })

  -- 创建一个补全窗口，宽度为20，高度为10
  local cmp = M.new({
    'option 1',
    'option 2',
    'option 3',
    'option 4',
    'option 5',
    'option 6',
    'option 7',
  })

  map.n('<Down>', function()
    cmp:move(1)
  end)
  map.n('<Up>', function()
    cmp:move(-1)
  end)
  map.n('-', function()
    cmp:enter()
  end)
end

return M
