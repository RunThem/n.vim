-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

require('keymap.remap')
local keymap = require('core.keymap')
local nmap, imap, xmap = keymap.nmap, keymap.imap, keymap.xmap
local silent, noremap = keymap.silent, keymap.noremap
local expr, remap = keymap.expr, keymap.remap
local opts = keymap.new_opts
local cmd = keymap.cmd

require('keymap.config')

imap({
  { '<Tab>', _G.smart_tab, opts(expr, remap) },
  { '<S-Tab>', _G.smart_shift_tab, opts(expr, remap) },
})

-- nvimtree
nmap({ '<Leader>e', cmd('NvimTreeToggle'), opts(noremap, silent) })

-- Telescope
nmap({
  { '<Leader>fb', cmd('Telescope buffers'), opts(noremap, silent) },
  { '<Leader>fs', cmd('Telescope live_grep'), opts(noremap, silent) },
  { '<Leader>ff', cmd('Telescope find_files find_command=rg,--ignore,--hidden,--files'), opts(noremap, silent) },
})

-- mywords
nmap({
  { '<Leader>m', cmd("lua require('mywords').hl_toggle()"), opts(noremap, silent) },
  { '<Leader>c', cmd("lua require('mywords').uhl_all()"), opts(noremap, silent) },
})

-- lspsaga
nmap({
  { '[e', cmd('Lspsaga diagnostic_jump_next') },
  { ']e', cmd('Lspsaga diagnostic_jump_prev') },
  { '[c', cmd('Lspsaga show_cursor_diagnostics') },
  { 'K', cmd('Lspsaga hover_doc') },
  { 'ga', cmd('Lspsaga code_action') },
  { 'gd', cmd('Lspsaga peek_definition') },
  { 'gs', cmd('Lspsaga signature_help') },
  { 'gr', cmd('Lspsaga rename') },
  { 'gh', cmd('Lspsaga lsp_finder') },
  { '<Leader>o', cmd('LSoutlineToggle') },
  { '<Leader>g', cmd('Lspsaga open_floaterm lazygit') },
})

-- coman
nmap({ 'gcc', cmd('ComComment') })
xmap({ 'gcc', ':ComComment<Cr>' })
nmap({ 'gcj', cmd('ComAnnotation') })

-- hop
nmap({
  { 'f', cmd('HopChar1CurrentLine') },
  { 'F', cmd('HopWord') },
  { 'L', cmd('HopLine') },
})
