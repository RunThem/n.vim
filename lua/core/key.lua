-- author: RunThem https://github.com/RunThem
-- date: 2023-10-03
-- License: MIT

local util = require('core.util')
local nmap, imap, cmap, tmap = util.nmap, util.imap, util.cmap, util.tmap
local silent, noremap = util.silent, util.noremap
local expr = util.expr
local opts = util.new_opts
local cmd = util.cmd

-- noremap remap
nmap({
  { ']b', cmd('bn'), opts(noremap) },
  { '[b', cmd('bp'), opts(noremap) },
  -- window jump
  { 'H', '0', opts(noremap) },
  { 'L', '$', opts(noremap) },
  { 'J', '', opts(noremap) },
  { 'K', '', opts(noremap) },
  { '<C-h>', '3b', opts(noremap) },
  { '<C-l>', '3w', opts(noremap) },
  { '<C-j>', '5j', opts(noremap) },
  { '<C-k>', '5k', opts(noremap) },

  {
    '0',
    function()
      local api = vim.api
      local head = (api.nvim_get_current_line():find('[^%s]') or 1) - 1
      local cursor = api.nvim_win_get_cursor(0)

      if cursor[2] == head then
        return '0'
      end
      return '^'
    end,
    opts(expr),
  },
})

-- insertmode remap
imap({
  { '<C-h>', '<Left>' },
  { '<C-l>', '<Right>' },
  { '<C-j>', '<Down>' },
  { '<C-k>', '<Up>' },

  {
    '<C-e>',
    function()
      return vim.fn.pumvisible() == 1 and '<C-e>' or '<End>'
    end,
    opts(expr),
  },

  {
    '**',
    function()
      local ft = vim.bo.filetype
      if ft == 'c' or ft == 'cpp' or ft == 'go' then
        return '/*  */<Esc>2hi'
      end
      return '**'
    end,
    opts(expr),
  },
  {
    '&*',
    function()
      local ft = vim.bo.filetype
      if ft == 'c' or ft == 'cpp' then
        return '/**\n\n*/<Esc>2hx<Up>a '
      end
      return '&*'
    end,
    opts(expr),
  },
  {
    ';;',
    function()
      local ft = vim.bo.filetype
      if ft == 'c' or ft == 'cpp' or ft == 'rust' then
        return '<Esc>A;'
      end
      return ';;'
    end,
    opts(expr),
  },
})

-- commandline remap
cmap({
  { '<C-b>', '<Left>' },
  { '<C-f>', '<Right>' },
  { '<C-a>', '<Home>' },
  { '<C-e>', '<End>' },
})

-- terminal remap
tmap({ '<Esc>', [[<C-\><C-n>]] })

nmap({ '<Leader>d', cmd('lua require("dev").setup()') })