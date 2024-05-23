--- noremap remap
map.n('<C-j>', '3j')
map.n('<C-k>', '3k')

map.n('j', function()
  return vim.v.count == 0 and 'gj' or 'j'
end, { expr = true })

map.n('k', function()
  return vim.v.count == 0 and 'gk' or 'k'
end, { expr = true })

map.n('0', function()
  local head = (util.cur_line():find('[^%s]') or 1) - 1
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
map.n('<Leader>S', ':e ' .. util.confpath('lua/script.lua'))
map.n('<Leader>s', function()
  local exec = io.popen(util.confpath('lua/script.lua'))
  local out = exec:read('*l')

  exec:close()

  util.cur_write(out)
end)
