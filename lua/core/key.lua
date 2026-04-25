--- noremap remap
map.n('<C-j>', '5j')
map.n('<C-k>', '5k')

map.n('j', function()
  return vim.v.count == 0 and 'gj' or 'j'
end, true)

map.n('k', function()
  return vim.v.count == 0 and 'gk' or 'k'
end, true)

map.n('0', function()
  local head = (util.cline():find('[^%s]') or 1) - 1
  return util.col() == head and '0' or '^'
end, true)

--- insertmode remap
map.i('**', function()
  local ft = vim.bo.filetype
  if ft == 'c' or ft == 'cpp' or ft == 'go' then
    return '/*  */<Esc>2hi'
  end

  return '**'
end, true)

map.i(';;', function()
  local ft = vim.bo.filetype
  if ft == 'c' or ft == 'cpp' or ft == 'rust' then
    return '<Esc>A;'
  end

  return ';;'
end, true)

map.i(',,', function()
  local ft = vim.bo.filetype
  if ft == 'rust' then
    return '<Esc>A,'
  end

  return ',,'
end, true)

--- terminal remap
map.t('<Esc>', [[<C-\><C-n>]])

--- dev
map.n('<Leader>d', function()
  vim.cmd('w')
  vim.cmd('messages clear')
  vim.notify('Neovim Dev Output:')

  if package.loaded['dev'] ~= nil then
    package.loaded['dev'] = nil
  end

  require('dev').setup()
end)

--- script
map.n('<Leader>X', ':e ' .. util.confpath('lua/script.lua'))
map.n('<Leader>x', function()
  local exec = io.popen(util.confpath('lua/script.lua'))
  if exec == nil then
    return
  end

  util.cwrite(exec:read('*l'))
  exec:close()
end)

--- tree-sitter
local vts = vim.treesitter

local bufnr = 0
---@type TSNode|nil
local node
local coord
local is_pair = false

local function selection()
  ---@return nil|integer[]
  local function get_coord()
    if node == nil then
      node = vts.get_node()
    elseif not is_pair then
      node = node:parent()
    end

    if node == nil then
      return nil
    end

    local lcoord = { vts.get_node_range(node) }
    local text = vts.get_node_text(node, bufnr)
    if not is_pair and text:find('^[%(%[{\'"]') ~= nil and text:find('[%)%]}\'"]$') ~= nil then
      is_pair = true
      lcoord = { lcoord[1] + 1, lcoord[2] + 1, lcoord[3] + 1, lcoord[4] - 2 }
    else
      is_pair = false
      lcoord = { lcoord[1] + 1, lcoord[2], lcoord[3] + 1, lcoord[4] - 1 }
    end

    if lcoord[4] == -1 then
      return nil
    end

    return lcoord
  end

  local lcoord
  repeat
    lcoord = get_coord()
  until not (
      coord
      and lcoord ~= nil
      and coord[1] == lcoord[1]
      and coord[2] == lcoord[2]
      and coord[3] == lcoord[3]
      and coord[4] == lcoord[4]
    )

  if lcoord == nil or #lcoord ~= 4 then
    return
  end

  coord = lcoord

  vim.api.nvim_win_set_cursor(0, { lcoord[1], lcoord[2] })
  vim.cmd('normal! o')
  vim.api.nvim_win_set_cursor(0, { lcoord[3], lcoord[4] })
end

map.n('<Cr>', function()
  node = vts.get_node()
  bufnr = vim.api.nvim_get_current_buf()

  vim.cmd('normal! v')

  selection()
end)

map.v('<Cr>', function()
  selection()
end)
