-- author: RunThem https://github.com/RunThem
-- date: 2023-10-03
-- License: MIT

local util = require('core.util')
local map = util.map
local cmd = map.cmd

-- lspsaga
map.n('K', cmd('Lspsaga hover_doc'))
map.n('gr', cmd('Lspsaga rename'))
map.n('gh', cmd('Lspsaga finder'))
map.n('gd', cmd('Lspsaga peek_definition'))
map.n('gD', cmd('Lspsaga goto_definition'))
map.n('gt', cmd('Lspsaga peek_type_definition'))
map.n('gT', cmd('Lspsaga goto_type_definition'))
map.n('ga', cmd('Lspsaga code_action'))
map.n('gn', cmd('Lspsaga diagnostic_jump_next'))
map.n('go', cmd('Lspsaga outline'))
map.n('--', cmd('Lspsaga term_toggle'))
map.t('--', cmd('Lspsaga term_toggle'))

-- coman
map.n('gcc', cmd('ComComment'))
map.n('gcj', cmd('ComAnnotation'))
map.x('gcc', ':ComComment<Cr>')

-- flybuf
map.n('gb', cmd('FlyBuf'))

-- guard
map.n('==', cmd('GuardFmt'))

-- fzy
map.n('<leader>ff', function()
  local fzy = require('fzy')
  fzy.execute('fd', fzy.sinks.edit_file)
end)

map.n('<leader>fa', function()
  local fzy = require('fzy')
  fzy.execute('rg --no-heading --trim -nH .', fzy.sinks.edit_live_grep)
end)

-- complete
if _G.epo == true then
  local select_func = function(key)
    return function()
      if vim.fn.pumvisible() == 1 then
        local selected = vim.fn.complete_info({ 'selected' }).selected
        if selected == -1 then
          return '<C-n><C-y>'
        end

        return '<C-y>'
      end

      return key
    end
  end

  map.i('<Tab>', select_func('<Tab>'), { expr = true })
  map.i('<Cr>', select_func('<Cr>'), { expr = true })
else
  map.i('<C-x>', function()
    local cmp = require('cmp')

    cmp.complete({
      config = {
        sources = {
          { name = 'snippy', group_index = 1 },
        },
      },
    })
  end)
end
