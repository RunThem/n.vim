--- noremap remap
map.n('<C-j>', '3j')
map.n('<C-k>', '3k')
map.n('0', function()
  local head = (util.cline():find('[^%s]') or 1) - 1
  return util.col() == head and '0' or '^'
end)

--- insertmode remap
map.i('**', function()
  local ft = vim.bo.filetype
  if ft == 'c' or ft == 'cpp' or ft == 'go' then
    return '/*  */<Esc>2hi'
  end

  return '**'
end)

map.i(';;', function()
  local ft = vim.bo.filetype
  if ft == 'c' or ft == 'cpp' or ft == 'rust' then
    return '<Esc>A;'
  end

  return ';;'
end)

--- terminal remap
map.t('<Esc>', [[<C-\><C-n>]])

--- dev
map.n('<Leader>d', function()
  require('dev').setup()
end, { expr = false })

--- script
local path = util.conf_path() .. '/lua/script.lua'
map.n('<Leader>S', map.cmd('e ' .. path))
map.n('<Leader>s', function()
  local exec = io.popen(path)
  local out = exec:read('*l')

  exec:close()

  util.cwrite(out)
end)
