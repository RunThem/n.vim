local M = {}

local u = require('core.util')
local api, fn, ts = vim.api, vim.fn, vim.treesitter

local inf = u.info

function M.init()
  api.nvim_create_augroup('Dev', { clear = true })

  M.create_buf = function()
    local buf = vim.api.nvim_create_buf(false, true)
    api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

    return buf
  end

  M.create_win = function(check, buf, enter, opts)
    if check and api.nvim_win_is_valid(check) then
      api.nvim_win_close(check, true)
    end

    local winconfig = vim.tbl_extend('force', {
      relative = 'editor',
      anchor = 'NW',
      col = 0,
      focusable = true,
      style = 'minimal',
      border = 'none',
    }, opts)

    local win = api.nvim_open_win(buf, enter, winconfig)
    api.nvim_win_set_option(win, 'winblend', 0)
    api.nvim_win_set_option(win, 'wrap', false)

    return win
  end

  M.create_autocmd = function(event, opts)
    opts = vim.tbl_extend('force', opts, { group = 'Dev' })
    api.nvim_create_autocmd(event, opts)
  end
end

function M.setup()
  M.init()

  M._inbuf = M.create_buf()
  M._outbuf = M.create_buf()

  M._inwin = M.create_win(M._inwin, M._inbuf, true, {
    width = 30,
    height = 1,
    row = 20,
    col = 0,
    noautocmd = true,
    focusable = false,
  })

  M._outwin = M.create_win(M._outwin, M._outbuf, false, {
    width = 30,
    height = 5,
    row = 21,
    col = 0,
    noautocmd = false,
    focusable = true,
  })

  M.create_autocmd({ 'TextChanged', 'TextChangedI' }, {
    buffer = M._inbuf,
    callback = function()
      local iline = u.cline()

      vim.api.nvim_buf_set_lines(M._outbuf, 0, -1, true, { iline })
    end,
  })
end

return M
