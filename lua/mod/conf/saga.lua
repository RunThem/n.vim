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
  map.n('K', ':Lspsaga hover_doc')
  map.n('gr', ':Lspsaga rename')
  map.n('gh', ':Lspsaga finder')
  map.n('gd', ':Lspsaga peek_definition')
  map.n('gD', ':Lspsaga goto_definition')
  map.n('gt', ':Lspsaga peek_type_definition')
  map.n('gT', ':Lspsaga goto_type_definition')
  map.n('ga', ':Lspsaga code_action')
  map.n('gn', ':Lspsaga diagnostic_jump_next')
  map.n('go', ':Lspsaga outline')
  map.n('--', ':Lspsaga term_toggle')
  map.t('--', ':Lspsaga term_toggle')
end
