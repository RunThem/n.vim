return function()
  local hl = vim.api.nvim_set_hl

  -- vim.cmd('colorscheme porcelain')
  vim.cmd('colorscheme zephyr')

  local groups = {
    'Normal',
    'NormalFloat',
    'NormalNC',
    'FloatBorder',
    'Special',
    'Underlined',
    'NonText',
    'SignColumn',
    'EndOfBuffer',
    'TabLine',
    'TabLineSel',
    'StatusLine',
    'StatusLineNC',
  }

  for _, group in ipairs(groups) do
    hl(0, group, {})
  end

  -- stylua: ignore start
  hl(0, 'LineNr',                   { fg = '#61afaf' })
  hl(0, 'CursorLineNr',             { fg = '#f8ab17' })
  hl(0, 'VertSplit',                { fg = '#c98afa' })
  hl(0, 'Comment',                  { fg = '#6a8ad9' })
  hl(0, 'TabLineSel',               { fg = '#c98afa' })



  hl(0, 'PmenuSel',                 { bg = '#65CDD9', fg = '#000000' })
  hl(0, 'Pmenu',                    { fg = '#C5CDD9', bg = '#000000' })
  hl(0, 'CmpItemAbbrDeprecated',    { fg = '#7E8294', bg = 'NONE', strikethrough = true })
  hl(0, 'CmpItemAbbrMatch',         { fg = '#82AAFF', bg = 'NONE', bold = true })
  hl(0, 'CmpItemAbbrMatchFuzzy',    { fg = '#82AAFF', bg = 'NONE', bold = true })
  hl(0, 'CmpItemMenu',              { fg = '#0792EA', bg = 'NONE', italic = true })
  hl(0, 'CmpItemKindField',         { fg = '#EED8DA', bg = '#B5585F' })
  hl(0, 'CmpItemKindProperty',      { fg = '#EED8DA', bg = '#B5585F' })
  hl(0, 'CmpItemKindEvent',         { fg = '#EED8DA', bg = '#B5585F' })
  hl(0, 'CmpItemKindText',          { fg = '#C3E88D', bg = '#9FBD73' })
  hl(0, 'CmpItemKindEnum',          { fg = '#C3E88D', bg = '#9FBD73' })
  hl(0, 'CmpItemKindKeyword',       { fg = '#C3E88D', bg = '#9FBD73' })
  hl(0, 'CmpItemKindConstant',      { fg = '#FFE082', bg = '#D4BB6C' })
  hl(0, 'CmpItemKindConstructor',   { fg = '#FFE082', bg = '#D4BB6C' })
  hl(0, 'CmpItemKindReference',     { fg = '#FFE082', bg = '#D4BB6C' })
  hl(0, 'CmpItemKindFunction',      { fg = '#EADFF0', bg = '#A377BF' })
  hl(0, 'CmpItemKindStruct',        { fg = '#EADFF0', bg = '#A377BF' })
  hl(0, 'CmpItemKindClass',         { fg = '#EADFF0', bg = '#A377BF' })
  hl(0, 'CmpItemKindModule',        { fg = '#EADFF0', bg = '#A377BF' })
  hl(0, 'CmpItemKindOperator',      { fg = '#EADFF0', bg = '#A377BF' })
  hl(0, 'CmpItemKindVariable',      { fg = '#C5CDD9', bg = '#7E8294' })
  hl(0, 'CmpItemKindFile',          { fg = '#C5CDD9', bg = '#7E8294' })
  hl(0, 'CmpItemKindUnit',          { fg = '#F5EBD9', bg = '#D4A959' })
  hl(0, 'CmpItemKindSnippet',       { fg = '#F5EBD9', bg = '#D4A959' })
  hl(0, 'CmpItemKindFolder',        { fg = '#F5EBD9', bg = '#D4A959' })
  hl(0, 'CmpItemKindMethod',        { fg = '#DDE5F5', bg = '#6C8ED4' })
  hl(0, 'CmpItemKindValue',         { fg = '#DDE5F5', bg = '#6C8ED4' })
  hl(0, 'CmpItemKindEnumMember',    { fg = '#DDE5F5', bg = '#6C8ED4' })
  hl(0, 'CmpItemKindInterface',     { fg = '#D8EEEB', bg = '#58B5A8' })
  hl(0, 'CmpItemKindColor',         { fg = '#D8EEEB', bg = '#58B5A8' })
  hl(0, 'CmpItemKindTypeParameter', { fg = '#D8EEEB', bg = '#58B5A8' })
  -- stylua: ignore end

  -- local links = {
  --   ['@lsp.type.namespace'] = '@namespace',
  --   ['@lsp.type.type'] = '@type',
  --   ['@lsp.type.class'] = '@type',
  --   ['@lsp.type.enum'] = '@type',
  --   ['@lsp.type.interface'] = '@type',
  --   ['@lsp.type.struct'] = '@structure',
  --   ['@lsp.type.parameter'] = '@parameter',
  --   ['@lsp.type.variable'] = '@variable',
  --   ['@lsp.type.property'] = '@property',
  --   ['@lsp.type.enumMember'] = '@constant',
  --   ['@lsp.type.function'] = '@function',
  --   ['@lsp.type.method'] = '@method',
  --   ['@lsp.type.macro'] = '@macro',
  --   ['@lsp.type.decorator'] = '@function',
  -- }

  -- for newgroup, oldgroup in pairs(links) do
  --   vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
  -- end
end
