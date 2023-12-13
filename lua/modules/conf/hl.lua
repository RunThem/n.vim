return function()
  local hl = vim.api.nvim_set_hl

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
    hl(0, newgroup, { link = oldgroup, default = true })
  end

  -- stylua: ignore start
  hl(0, 'LineNr',                   { fg = '#61afaf' })
  hl(0, 'CursorLine',               { underline = true,  })
  hl(0, 'CursorLineNr',             { fg = '#f8ab17', italic = true })
  hl(0, 'VertSplit',                { fg = '#c98afa' })
  hl(0, 'Comment',                  { fg = '#6a8ad9' })
  hl(0, 'PmenuSel',                 { fg = '#000000', bg = '#65CDD9' })
  hl(0, 'Pmenu',                    { fg = '#C5CDD9', bg = '#000000' })
  -- stylua: ignore end
end
