-- author: RunThem https://github.com/RunThem
-- date: 2023-10-03
-- License: MIT

local util = require('core.util')
local map = util.map
local cmd = map.cmd

--- lspsaga
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

--- coman
map.n('gcc', cmd('ComComment'))
map.n('gcj', cmd('ComAnnotation'))
map.x('gcc', ':ComComment<Cr>')

--- flybuf
map.n('gb', cmd('FlyBuf'))

--- guard
map.n('==', cmd('GuardFmt'))

--- fzy
local azy = require('azy.builtins')
map.n('<leader>ff', azy.files())
map.n('<leader>fa', azy.files_contents())
map.n('<leader>fc', azy.curbuf_content())
map.n('<leader>fr', azy.lsp.references())

-- complete
map.i('<C-f>', '<C-x><C-f>')

_G.autocmd({ 'CompleteDone' }, {
  pattern = '*',
  callback = function()
    local u = require('core.util')

    local col = u.col()
    if u.cline():sub(col, col) == '/' then
      local key = vim.api.nvim_replace_termcodes('<C-x><C-f>', true, false, true)
      vim.api.nvim_feedkeys(key, 'i', true)
    end
  end,
})

map.i('<C-e>', function()
  if vim.fn.pumvisible() == 1 then
    require('epo').disable_trigger()

    return '<C-e>'
  end

  return '<Esc>g_a'
end, { expr = true })

map.i('<Tab>', function()
  if vim.fn.pumvisible() == 1 then
    local selected = vim.fn.complete_info({ 'selected' }).selected
    if selected ~= -1 then
      return '<C-y>'
    end

    return '<C-n><C-y>'
  elseif vim.snippet.jumpable(1) then
    return cmd('lua vim.snippet.jump(1)')
  end

  return '<Tab>'
end, { expr = true })

map.i('<S-Tab>', function()
  if vim.snippet.jumpable(-1) then
    return cmd('lua vim.snippet.jump(-1)')
  end

  return '<S-Tab>'
end, { expr = true })

map.i('<Cr>', function()
  if vim.fn.pumvisible() == 1 then
    local selected = vim.fn.complete_info({ 'selected' }).selected
    if selected ~= -1 then
      return '<C-y>'
    end

    return '<C-n><C-y>'
  end

  local col = util.col()
  local s, e = util.cline():find('{%s*}')

  if s ~= nil and col >= s and col <= e then
    return '<Cr><Esc><Up>o'
  end

  return '<Cr>'
end, { expr = true })
