local rootpath = util.datapath('sessions')
local options = { 'buffers', 'curdir', 'tabpages', 'winsize', 'skiprtp' } -- sessionoptions used for saving

---init
if not vim.uv.fs_stat(rootpath) then
  vim.uv.fs_mkdir(rootpath, 493)
end

local function session()
  local path = string.format('%s/%s.vim', rootpath, vim.fn.getcwd():gsub('/', '%%'))
  return vim.fn.fnameescape(path)
end

map.n('<Leader>x', function()
  vim.cmd('silent! source ' .. session())
end)

util.autocmd({ 'VimLeavePre' }, {
  callback = function()
    local tmp = vim.o.sessionoptions
    vim.o.sessionoptions = table.concat(options, ',')
    vim.cmd('mksession! ' .. session())
    vim.o.sessionoptions = tmp
  end,
})
