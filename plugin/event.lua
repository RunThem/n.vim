local api = vim.api

_G.autocmd({ 'BufWritePre' }, {
  pattern = { '/tmp/*', 'COMMIT_EDITMSG', 'MERGE_MSG', '*.tmp', '*.bak' },
  callback = function()
    vim.opt_local.undofile = false
  end,
})

_G.autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.conf',
  callback = function()
    api.nvim_buf_set_option(0, 'filetype', 'conf')
  end,
})

_G.autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.v',
  callback = function()
    api.nvim_buf_set_option(0, 'filetype', 'v')
  end,
})

_G.autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.li',
  callback = function()
    api.nvim_buf_set_option(0, 'filetype', 'little')
  end,
})

_G.autocmd({ 'TextYankPost' }, {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 400 })
  end,
})

-- disable default syntax in these file.
-- when file is larged ,load regex syntax
-- highlight will cause very slow
_G.autocmd({ 'Filetype' }, {
  pattern = '*.c,*.cpp,*.lua,*.go,*.rs,*.py,*.ts,*.tsx',
  callback = function()
    vim.cmd('syntax off')
  end,
})

if vim.fn.executable('fcitx-remote') == 1 then
  _G.autocmd({ 'InsertLeave' }, {
    callback = function()
      os.execute('fcitx-remote -c')
    end,
  })

  _G.autocmd({ 'InsertEnter' }, {
    callback = function()
      os.execute('fcitx-remote -c')
    end,
  })
end
