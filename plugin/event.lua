autocmd({ 'BufWritePre' }, {
  pattern = { '/tmp/*', 'COMMIT_EDITMSG', 'MERGE_MSG', '*.tmp', '*.bak' },
  callback = function()
    vim.opt_local.undofile = false
  end,
})

autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.conf',
  callback = function()
    vim.api.nvim_buf_set_option(0, 'filetype', 'conf')
  end,
})

autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.v',
  callback = function()
    vim.api.nvim_buf_set_option(0, 'filetype', 'v')
  end,
})

autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.li',
  callback = function()
    vim.api.nvim_buf_set_option(0, 'filetype', 'little')
  end,
})

autocmd({ 'TextYankPost' }, {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 400 })
  end,
})

-- disable default syntax in these file.
-- when file is larged ,load regex syntax
-- highlight will cause very slow
autocmd({ 'Filetype' }, {
  pattern = '*.c,*.cpp,*.lua,*.go,*.rs,*.py,*.ts,*.tsx',
  callback = function()
    vim.cmd('syntax off')
  end,
})

if vim.fn.executable('fcitx-remote') == 1 then
  autocmd({ 'InsertLeave' }, {
    callback = function()
      os.execute('fcitx-remote -c')
    end,
  })

  autocmd({ 'InsertEnter' }, {
    callback = function()
      os.execute('fcitx-remote -c')
    end,
  })
end
