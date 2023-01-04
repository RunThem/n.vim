-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local keymap = require('core.keymap')
local nmap, imap, cmap, tmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.tmap
local silent, noremap = keymap.silent, keymap.noremap
local expr = keymap.expr
local opts = keymap.new_opts
local cmd = keymap.cmd

-- noremap remap
nmap({
  { '<C-x>k', cmd('bdelete'), opts(noremap, silent) },
  { '<C-s>', cmd('write'), opts(noremap) },
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
})

-- insertmode remap
imap({
  { '<C-h>', '<Left>' },
  { '<C-l>', '<Right>' },
  { '<C-j>', '<Down>' },
  { '<C-k>', '<Up>' },

  { '<C-s>', '<Esc>:w<Cr>' },

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
    ';;',
    function()
      local ft = vim.bo.filetype
      if ft == 'c' or ft == 'cpp' then
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
