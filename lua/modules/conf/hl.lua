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

  -- stylua: ignore start
  hl('@lsp.type.parameter',      { fg = '#c45a65', italic = true })
  hl('@lsp.type.macro',          { fg = '#957fb8' })
  hl('@lsp.type.label',          { fg = '#c45a65' })

  hl('@keyword',                 { fg = '#bc84a8', italic = true })

  hl('LineNr',                   { fg = '#61afaf' })
  hl('CursorWord',               { bg = 'NONE', underline = true })
  hl('CursorLine',               { bg = 'NONE', underline = true })
  hl('CursorLineNr',             { fg = '#f8ab17', italic = true })
  hl('VertSplit',                { fg = '#c98afa' })
  hl('Comment',                  { fg = '#6a8ad9' })
  hl('PmenuSel',                 { fg = '#000000', bg = '#65cdd9' })
  hl('Pmenu',                    { fg = '#c5cdd9', bg = '#000000' })

  hl('AdCustomFold',             { fg = '#bf8040' })

  hl('DiagnosticUnnecessary',    { fg = '#6a8ad9' })

  --[[
  hl('CmpItemAbbrDeprecated',    { fg = '#7e8294', bg = 'NONE', strikethrough = true })
  hl('CmpItemAbbrMatch',         { fg = '#82aaff', bg = 'NONE', bold = true })
  hl('CmpItemAbbrMatchFuzzy',    { fg = '#82aaff', bg = 'NONE', bold = true })
  hl('CmpItemMenu',              { fg = '#0792ea', bg = 'NONE', italic = true })
  hl('CmpItemKindField',         { fg = '#eed8da', bg = '#b5585f' })
  hl('CmpItemKindProperty',      { fg = '#eed8da', bg = '#b5585f' })
  hl('CmpItemKindEvent',         { fg = '#eed8da', bg = '#b5585f' })
  hl('CmpItemKindText',          { fg = '#c3e88d', bg = '#9fbd73' })
  hl('CmpItemKindEnum',          { fg = '#c3e88d', bg = '#9fbd73' })
  hl('CmpItemKindKeyword',       { fg = '#c3e88d', bg = '#9fbd73' })
  hl('CmpItemKindConstant',      { fg = '#ffe082', bg = '#d4bb6c' })
  hl('CmpItemKindConstructor',   { fg = '#ffe082', bg = '#d4bb6c' })
  hl('CmpItemKindReference',     { fg = '#ffe082', bg = '#d4bb6c' })
  hl('CmpItemKindFunction',      { fg = '#eadff0', bg = '#a377bf' })
  hl('CmpItemKindStruct',        { fg = '#eadff0', bg = '#a377bf' })
  hl('CmpItemKindClass',         { fg = '#eadff0', bg = '#a377bf' })
  hl('CmpItemKindModule',        { fg = '#eadff0', bg = '#a377bf' })
  hl('CmpItemKindOperator',      { fg = '#eadff0', bg = '#a377bf' })
  hl('CmpItemKindVariable',      { fg = '#c5cdd9', bg = '#7e8294' })
  hl('CmpItemKindFile',          { fg = '#c5cdd9', bg = '#7e8294' })
  hl('CmpItemKindUnit',          { fg = '#f5ebd9', bg = '#d4a959' })
  hl('CmpItemKindSnippet',       { fg = '#f5ebd9', bg = '#d4a959' })
  hl('CmpItemKindFolder',        { fg = '#f5ebd9', bg = '#d4a959' })
  hl('CmpItemKindMethod',        { fg = '#dde5f5', bg = '#6c8ed4' })
  hl('CmpItemKindValue',         { fg = '#dde5f5', bg = '#6c8ed4' })
  hl('CmpItemKindEnumMember',    { fg = '#dde5f5', bg = '#6c8ed4' })
  hl('CmpItemKindInterface',     { fg = '#d8eeeb', bg = '#58b5a8' })
  hl('CmpItemKindColor',         { fg = '#d8eeeb', bg = '#58b5a8' })
  hl('CmpItemKindTypeParameter', { fg = '#d8eeeb', bg = '#58b5a8' })
  --]]
  -- stylua: ignore end
end
