-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT
-- recommend some vim mode key defines in this file

local keymap = require('core.keymap')
local nmap, imap, cmap, xmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- Use space as leader key
vim.g.mapleader = ' '

-- leaderkey
nmap({ ' ', '', opts(noremap) })
xmap({ ' ', '', opts(noremap) })

-- usage example
nmap({
  -- noremal remap
  -- close buffer
  { '<C-x>k', cmd('bdelete'), opts(noremap, silent) },
  -- save
  { '<C-s>', cmd('write'), opts(noremap) },
  -- yank
  { 'Y', 'y$', opts(noremap) },
  -- buffer jump
  { ']b', cmd('bn'), opts(noremap) },
  { '[b', cmd('bp'), opts(noremap) },
  -- remove trailing white space
  { '<Leader>t', cmd('TrimTrailingWhitespace'), opts(noremap) },
  -- window jump
  { '<C-h>', '3b', opts(noremap) },
  { '<C-l>', '3w', opts(noremap) },
  { '<C-j>', '5j', opts(noremap) },
  { '<C-k>', '5k', opts(noremap) },

  { 'H', '0', opts(noremap) },
  { 'L', '$', opts(noremap) },
  { 'J', '', opts(noremap) },
  { 'K', '', opts(noremap) },
})

imap({
  -- insert mode
  { '<C-h>', '<Bs>', opts(noremap) },
  { '<C-e>', '<End>', opts(noremap) },
  { '**', '/*  */<Esc>2hi', opts(noremap) },
  { ';;', '<Esc>A;', opts(noremap) },

  { '<C-h>', '<Left>', opts(noremap) },
  { '<C-l>', '<Right>', opts(noremap) },
  { '<C-j>', '<Down>', opts(noremap) },
  { '<C-k>', '<Up>', opts(noremap) },
})

-- commandline remap
cmap({ '<C-b>', '<Left>', opts(noremap) })
