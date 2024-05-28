local rootpath = util.datapath('sessions')
local options = { 'buffers', 'curdir', 'folds', 'tabpages', 'winsize', 'skiprtp' } -- sessionoptions used for saving

---init
if not vim.uv.fs_stat(rootpath) then
  vim.uv.fs_mkdir(rootpath, 493)
end

local function session()
  local path = string.format('%s/%s.vim', rootpath, vim.fn.getcwd():gsub('/', '%%'))
  return vim.fn.fnameescape(path)
end

map.n('<Leader>ls', function()
  vim.cmd('silent! source ' .. session())

  vim.notify('Load session!!!')
end)

map.n('<Leader>ss', function()
  local tmp = vim.o.sessionoptions
  vim.o.sessionoptions = table.concat(options, ',')
  vim.cmd('mksession! ' .. session())
  vim.o.sessionoptions = tmp

  vim.notify('Save session!!!')
end)
