local api = vim.api
local n_vim_group = vim.api.nvim_create_augroup('N_VimGroup', {})

api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = n_vim_group,
  pattern = { '/tmp/*', 'COMMIT_EDITMSG', 'MERGE_MSG', '*.tmp', '*.bak' },
  callback = function()
    vim.opt_local.undofile = false
  end,
})

api.nvim_create_autocmd('BufRead', {
  group = n_vim_group,
  pattern = '*.conf',
  callback = function()
    api.nvim_buf_set_option(0, 'filetype', 'conf')
  end,
})

api.nvim_create_autocmd('TextYankPost', {
  group = n_vim_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 400 })
  end,
})

api.nvim_create_autocmd({ 'WinEnter', 'BufEnter', 'InsertLeave' }, {
  group = n_vim_group,
  pattern = '*',
  callback = function()
    if vim.bo.filetype ~= 'dashboard' and not vim.opt_local.cursorline:get() then
      vim.opt_local.cursorline = true
    end
  end,
})

-- disable default syntax in these file.
-- when file is larged ,load regex syntax
-- highlight will cause very slow
api.nvim_create_autocmd('Filetype', {
  group = n_vim_group,
  pattern = '*.c,*.cpp,*.lua,*.go,*.rs,*.py,*.ts,*.tsx',
  callback = function()
    vim.cmd('syntax off')
  end,
})
