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

--- terminal remap
map.t('<Esc>', [[<C-\><C-n>]])

--- dev
map.n('<Leader>d', function()
  vim.cmd('w')

  if package.loaded['dev'] ~= nil then
    package.loaded['dev'] = nil
  end

  require('dev').setup()
end)

--- script
map.n('<Leader>S', map.cmd('e ' .. util.confpath('lua/script.lua')))
map.n('<Leader>s', function()
  local exec = io.popen(util.confpath('lua/script.lua'))
  local out = exec:read('*l')

  exec:close()

  util.cwrite(out)
end)
