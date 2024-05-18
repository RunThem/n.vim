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

--- flybuf
map.n('gb', cmd('FlyBuf'))

--- guard
map.n('==', cmd('GuardFmt'))
