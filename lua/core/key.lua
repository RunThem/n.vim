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
