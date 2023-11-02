-- author: RunThem https://github.com/RunThem
-- date: 2023-10-03
-- License: MIT

local util = require('core.util')
local map = util.map
local cmd = map.cmd
local api = vim.api

--- noremap remap
map.n('<C-j>', '3j')
map.n('<C-k>', '3k')
map.n('0', function()
  local head = (util.cline():find('[^%s]') or 1) - 1
  return util.col() == head and '0' or '^'
end, { expr = true })

--- insertmode remap
map.i('**', function()
  local ft = vim.bo.filetype
  if ft == 'c' or ft == 'cpp' or ft == 'go' then
    return '/*  */<Esc>2hi'
  end

  return '**'
end, { expr = true })

map.i(';;', function()
  local ft = vim.bo.filetype
  if ft == 'c' or ft == 'cpp' or ft == 'rust' then
    return '<Esc>A;'
  end

  return ';;'
end, { expr = true })

-- complete
map.i('<C-f>', '<C-x><C-f>')

_G.autocmd({ 'CompleteDone' }, {
  pattern = '*',
  callback = function()
    local u = require('core.util')

    local col = u.col()
    if u.cline():sub(col, col) == '/' then
      local key = vim.api.nvim_replace_termcodes('<C-x><C-f>', true, false, true)
      vim.api.nvim_feedkeys(key, 'i', true)
    end
  end,
})

map.i('<C-e>', function()
  return vim.fn.pumvisible() == 1 and '<C-e>' or '<End>'
end, { expr = true })

map.i('<Tab>', function()
  if vim.fn.pumvisible() == 1 then
    local selected = vim.fn.complete_info({ 'selected' }).selected
    if selected ~= -1 then
      return '<C-y>'
    end

    return '<C-n><C-y>'
  elseif vim.snippet.jumpable(1) then
    return cmd('lua vim.snippet.jump(1)')
  end

  return '<Tab>'
end, { expr = true })

map.i('<S-Tab>', function()
  if vim.snippet.jumpable(-1) then
    return cmd('lua vim.snippet.jump(-1)')
  end

  return '<S-Tab>'
end, { expr = true })

map.i('<Cr>', function()
  if vim.fn.pumvisible() == 1 then
    local selected = vim.fn.complete_info({ 'selected' }).selected
    if selected ~= -1 then
      return '<C-y>'
    end

    return '<C-n><C-y>'
  end

  local col = util.col()
  local s, e = util.cline():find('{%s*}')

  if s ~= nil and col >= s and col <= e then
    return '<Cr><Esc><Up>o'
  end

  return '<Cr>'
end, { expr = true })

--- terminal remap
map.t('<Esc>', [[<C-\><C-n>]])

--- dev
map.n('<Leader>d', function()
  require('dev').setup()
end)

--- script
local path = util.conf_path() .. '/lua/script.lua'
map.n('<Leader>S', cmd('e ' .. path))
map.n('<Leader>s', function()
  local cmd = io.popen(path)
  local out = cmd:read('*l')

  cmd:close()

  util.cwrite(out)
end)
