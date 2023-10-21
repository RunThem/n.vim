-- author: RunThem https://github.com/RunThem
-- date: 2023-10-03
-- License: MIT

local util = require('core.util')
local nmap, imap, xmap, smap, tmap = util.nmap, util.imap, util.xmap, util.smap, util.tmap
local silent, noremap = util.silent, util.noremap
local expr, remap = util.expr, util.remap
local opts = util.new_opts
local cmd = util.cmd

-- lspsaga
nmap({
  { 'K', cmd('Lspsaga hover_doc'), opts(noremap, silent) },
  { 'gr', cmd('Lspsaga rename'), opts(noremap, silent) },
  { 'gh', cmd('Lspsaga finder'), opts(noremap, silent) },
  { 'gd', cmd('Lspsaga peek_definition'), opts(noremap, silent) },
  { 'gD', cmd('Lspsaga goto_definition'), opts(noremap, silent) },
  { 'gt', cmd('Lspsaga peek_type_definition'), opts(noremap, silent) },
  { 'gT', cmd('Lspsaga goto_type_definition'), opts(noremap, silent) },
  { 'ga', cmd('Lspsaga code_action'), opts(noremap, silent) },
  { 'gn', cmd('Lspsaga diagnostic_jump_next'), opts(noremap, silent) },
  { '<Leader>o', cmd('Lspsaga outline'), opts(noremap, silent) },
})

nmap({ '--', cmd('Lspsaga term_toggle'), opts(noremap, silent) })
tmap({ '--', cmd('Lspsaga term_toggle'), opts(noremap, silent) })

-- coman
nmap({
  { 'gcc', cmd('ComComment'), opts(noremap, silent) },
  { 'gcj', cmd('ComAnnotation'), opts(noremap, silent) },
})

xmap({ 'gcc', ':ComComment<Cr>', opts(noremap, silent) })

-- flybuf
nmap({ 'gb', cmd('FlyBuf'), opts(noremap, silent) })

-- guard
nmap({ '==', cmd('GuardFmt'), opts(noremap, silent) })

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

if _G.epo == true then
  imap({
    {
      '<Tab>',
      function()
        if vim.fn.pumvisible() == 1 then
          return '<C-n><C-y>'
        end

        return '<Tab>'
      end,
      opts(expr),
    },
    {
      '<Cr>',
      function()
        if vim.fn.pumvisible() == 1 then
          return '<C-y>'
        end

        return '<Cr>'
      end,
      opts(expr),
    },
  })
else
  imap({
    '<C-x>',
    function()
      local cmp = require('cmp')

      cmp.complete({
        config = {
          sources = {
            { name = 'snippy', group_index = 1 },
          },
        },
      })
    end,
    opts(noremap, silent),
  })
end
