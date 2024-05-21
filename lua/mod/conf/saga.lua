return function()
  local saga = require('lspsaga')

  saga.setup({
    symbol_in_winbar = {
      enable = false,
    },
    outline = {
      win_width = 70,
      close_after_jump = true,
    },
  })

  ---@keymap
  map.n('K', map.cmd('Lspsaga hover_doc'))
  map.n('gr', map.cmd('Lspsaga rename'))
  map.n('gh', map.cmd('Lspsaga finder'))
  map.n('gd', map.cmd('Lspsaga peek_definition'))
  map.n('gD', map.cmd('Lspsaga goto_definition'))
  map.n('gt', map.cmd('Lspsaga peek_type_definition'))
  map.n('gT', map.cmd('Lspsaga goto_type_definition'))
  map.n('ga', map.cmd('Lspsaga code_action'))
  map.n('gn', map.cmd('Lspsaga diagnostic_jump_next'))
  map.n('go', map.cmd('Lspsaga outline'))
  map.n('--', map.cmd('Lspsaga term_toggle'))
  map.t('--', map.cmd('Lspsaga term_toggle'))
end
