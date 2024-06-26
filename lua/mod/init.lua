if vim.g.mod then
  local lazypath = string.format('%s/lazy/lazy.nvim', util.datapath())
  if not vim.uv.fs_stat(lazypath) then
    vim.cmd('!git clone https://github.com/folke/lazy.nvim ' .. lazypath)
  end

  vim.opt.runtimepath:prepend(lazypath)

  require('lazy').setup(require('mod.mods'), {
    lockfile = util.datapath('lazy-lock.json'),
  })
end
