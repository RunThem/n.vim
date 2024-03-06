return function()
  local hl = function(name, var)
    vim.api.nvim_set_hl(0, name, var)
  end

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
    hl(group, {})
  end

  local links = {
    ['@lsp.type.namespace'] = '@namespace',
    ['@lsp.type.type'] = '@type',
    ['@lsp.type.class'] = '@type',
    ['@lsp.type.enum'] = '@type',
    ['@lsp.type.interface'] = '@type',
    ['@lsp.type.struct'] = '@structure',
    ['@lsp.type.parameter'] = '@parameter',
    ['@lsp.type.variable'] = '@variable',
    ['@lsp.type.property'] = '@property',
    ['@lsp.type.enumMember'] = '@constant',
    ['@lsp.type.function'] = '@function',
    ['@lsp.type.method'] = '@method',
    ['@lsp.type.macro'] = '@macro',
    ['@lsp.type.decorator'] = '@function',
  }

  for newgroup, oldgroup in pairs(links) do
    hl(newgroup, { link = oldgroup, default = true })
  end

  -- stylua: ignore start
  hl('LineNr',                   { fg = '#61afaf' })
  hl('CursorWord',               { bg = 'NONE', underline = true })
  hl('CursorLine',               { bg = 'NONE', underline = true })
  hl('CursorLineNr',             { fg = '#f8ab17', italic = true })
  hl('VertSplit',                { fg = '#c98afa' })
  hl('Comment',                  { fg = '#6a8ad9' })
  hl('PmenuSel',                 { fg = '#000000', bg = '#65CDD9' })
  hl('Pmenu',                    { fg = '#C5CDD9', bg = '#000000' })

  hl('AdCustomFold',             { fg = '#bf8040' })

  hl('DiagnosticUnnecessary',    { fg = '#6A8AD9' })

  hl('CmpItemAbbrDeprecated',    { fg = '#7E8294', bg = 'NONE', strikethrough = true })
  hl('CmpItemAbbrMatch',         { fg = '#82AAFF', bg = 'NONE', bold = true })
  hl('CmpItemAbbrMatchFuzzy',    { fg = '#82AAFF', bg = 'NONE', bold = true })
  hl('CmpItemMenu',              { fg = '#0792EA', bg = 'NONE', italic = true })
  hl('CmpItemKindField',         { fg = '#EED8DA', bg = '#B5585F' })
  hl('CmpItemKindProperty',      { fg = '#EED8DA', bg = '#B5585F' })
  hl('CmpItemKindEvent',         { fg = '#EED8DA', bg = '#B5585F' })
  hl('CmpItemKindText',          { fg = '#C3E88D', bg = '#9FBD73' })
  hl('CmpItemKindEnum',          { fg = '#C3E88D', bg = '#9FBD73' })
  hl('CmpItemKindKeyword',       { fg = '#C3E88D', bg = '#9FBD73' })
  hl('CmpItemKindConstant',      { fg = '#FFE082', bg = '#D4BB6C' })
  hl('CmpItemKindConstructor',   { fg = '#FFE082', bg = '#D4BB6C' })
  hl('CmpItemKindReference',     { fg = '#FFE082', bg = '#D4BB6C' })
  hl('CmpItemKindFunction',      { fg = '#EADFF0', bg = '#A377BF' })
  hl('CmpItemKindStruct',        { fg = '#EADFF0', bg = '#A377BF' })
  hl('CmpItemKindClass',         { fg = '#EADFF0', bg = '#A377BF' })
  hl('CmpItemKindModule',        { fg = '#EADFF0', bg = '#A377BF' })
  hl('CmpItemKindOperator',      { fg = '#EADFF0', bg = '#A377BF' })
  hl('CmpItemKindVariable',      { fg = '#C5CDD9', bg = '#7E8294' })
  hl('CmpItemKindFile',          { fg = '#C5CDD9', bg = '#7E8294' })
  hl('CmpItemKindUnit',          { fg = '#F5EBD9', bg = '#D4A959' })
  hl('CmpItemKindSnippet',       { fg = '#F5EBD9', bg = '#D4A959' })
  hl('CmpItemKindFolder',        { fg = '#F5EBD9', bg = '#D4A959' })
  hl('CmpItemKindMethod',        { fg = '#DDE5F5', bg = '#6C8ED4' })
  hl('CmpItemKindValue',         { fg = '#DDE5F5', bg = '#6C8ED4' })
  hl('CmpItemKindEnumMember',    { fg = '#DDE5F5', bg = '#6C8ED4' })
  hl('CmpItemKindInterface',     { fg = '#D8EEEB', bg = '#58B5A8' })
  hl('CmpItemKindColor',         { fg = '#D8EEEB', bg = '#58B5A8' })
  hl('CmpItemKindTypeParameter', { fg = '#D8EEEB', bg = '#58B5A8' })
  -- stylua: ignore end
end
