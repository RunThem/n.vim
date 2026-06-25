if vim.g.mod then
  local lazypath = util.datapath('/lazy/lazy.nvim')
  if not vim.uv.fs_stat(lazypath) then
    vim.cmd('!git clone https://github.com/folke/lazy.nvim ' .. lazypath)
  end

  vim.opt.runtimepath:prepend(lazypath)

  local plugins = require('mod.mods')

  require('lazy').setup(plugins)
end
