-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

require('keymap.remap')
local keymap = require('core.keymap')
local nmap, imap, xmap, smap, tmap = keymap.nmap, keymap.imap, keymap.xmap, keymap.smap, keymap.tmap
local silent, noremap = keymap.silent, keymap.noremap
local expr, remap = keymap.expr, keymap.remap
local opts = keymap.new_opts
local cmd = keymap.cmd

require('keymap.config')

imap({
  { '<Tab>', _G.smart_tab, opts(expr, remap) },
  { '<S-Tab>', _G.smart_shift_tab, opts(expr, remap) },
})

smap({
  { '<Tab>', _G.smart_tab, opts(expr, remap) },
  { '<S-Tab>', _G.smart_shift_tab, opts(expr, remap) },
})

-- LspUI
nmap({
  { 'K', cmd('LspUI hover'), opts(noremap, silent) },
  { 'gr', cmd('LspUI rename'), opts(noremap, silent) },
  { 'gd', cmd('LspUI peek_definition'), opts(noremap, silent) },
  { 'gt', cmd('LspUI type_peek_definition'), opts(noremap, silent) },
  { 'ga', cmd('LspUI code_action'), opts(noremap, silent) },
  { 'gn', cmd('LspUI diagnostic next'), opts(noremap, silent) },
})

-- coman
nmap({
  { 'gcc', cmd('ComComment'), opts(noremap, silent) },
  { 'gcj', cmd('ComAnnotation'), opts(noremap, silent) },
})

xmap({ 'gcc', ':ComComment<Cr>', opts(noremap, silent) })

-- nvterm
nmap({ '==', cmd("lua require('nvterm.terminal').toggle('float')"), opts(noremap, silent) })
tmap({ '==', cmd("lua require('nvterm.terminal').toggle('float')"), opts(noremap, silent) })

-- flybuf
nmap({ 'gb', cmd('FlyBuf'), opts(noremap, silent) })

-- fzy
nmap({
  {
    '<Leader>ff',
    function()
      local fzy = require('fzy')
      fzy.execute('fd', fzy.sinks.edit_file)
    end,
    opts(noremap, silent),
  },
  {
    '<Leader>fa',
    function()
      local fzy = require('fzy')
      fzy.execute('rg --no-heading --trim -nH .', fzy.sinks.edit_live_grep)
    end,
    opts(noremap, silent),
  },
})
