util.autocmd({ 'BufWritePre' }, {
  pattern = { '/tmp/*', 'COMMIT_EDITMSG', 'MERGE_MSG', '*.tmp', '*.bak' },
  callback = function()
    vim.opt_local.undofile = false
  end,
})

util.autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.conf',
  callback = function()
    vim.api.nvim_buf_set_option(0, 'filetype', 'conf')
  end,
})

util.autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.v',
  callback = function()
    vim.api.nvim_buf_set_option(0, 'filetype', 'v')
  end,
})

util.autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.li',
  callback = function()
    vim.api.nvim_buf_set_option(0, 'filetype', 'little')
  end,
})

util.autocmd({ 'TextYankPost' }, {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 400 })
  end,
})

-- disable default syntax in these file.
-- when file is larged ,load regex syntax
-- highlight will cause very slow
util.autocmd({ 'Filetype' }, {
  pattern = '*.c,*.cpp,*.lua,*.go,*.rs,*.py,*.ts,*.tsx',
  callback = function()
    vim.cmd('syntax off')
  end,
})

util.autocmd({ 'CmdlineEnter' }, {
  once = true,
  callback = function()
    local shada = vim.fn.stdpath('state') .. '/shada/main.shada'
    vim.o.shadafile = shada
    vim.cmd('rshada! ' .. shada)
  end,
})

vim.defer_fn(function()
  if vim.fn.executable('fcitx-remote') == 1 then
    util.autocmd({ 'InsertLeave' }, {
      callback = function()
        os.execute('fcitx-remote -c')
      end,
    })

    util.autocmd({ 'InsertEnter' }, {
      callback = function()
        os.execute('fcitx-remote -c')
      end,
    })
  end
end, 1000)
