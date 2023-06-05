-- author: glepnr https://github.com/glepnir
-- date: 2023-03-26
-- License: MIT

local config = {}

function config.colorscheme()
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
    vim.cmd(string.format('highlight clear %s', group))
    vim.cmd(string.format('highlight %s guibg=NONE guifg=NONE', group))
  end

  vim.cmd('highlight LineNr                   guibg=NONE guifg=#61afaf')
  vim.cmd('highlight CursorLineNr             guibg=NONE guifg=#f8ab17') -- #e95678
  vim.cmd('highlight VertSplit                guibg=NONE guifg=#c98afa')
  vim.cmd('highlight Comment                  guibg=NONE guifg=#6a8ad9')
  vim.cmd('highlight TelescopeNormal          guibg=NONE guifg=#61afaf')
  vim.cmd('highlight ToggleTerm1Normal        guibg=NONE guifg=#61afaf')
  vim.cmd('highlight TabLineSel               guibg=NONE guifg=#c98afa')

  vim.cmd('highlight CmpItemAbbrDeprecated    guibg=NONE guifg=NONE')
  vim.cmd('highlight CmpItemAbbrMatch         guibg=NONE guifg=NONE')
  vim.cmd('highlight CmpItemAbbrMatchFuzzy    guibg=NONE guifg=NONE')
  vim.cmd('highlight CmpItemMenu              guibg=NONE guifg=NONE')
  vim.cmd('highlight CmpItemKindField         guibg=NONE guifg=#75beff')
  vim.cmd('highlight CmpItemKindProperty      guibg=NONE guifg=#75beff')
  vim.cmd('highlight CmpItemKindEvent         guibg=NONE guifg=#75beff')
  vim.cmd('highlight CmpItemKindText          guibg=NONE guifg=#9FBD73')
  vim.cmd('highlight CmpItemKindEnum          guibg=NONE guifg=#9FBD73')
  vim.cmd('highlight CmpItemKindKeyword       guibg=NONE guifg=#9FBD73')
  vim.cmd('highlight CmpItemKindConstant      guibg=NONE guifg=#D4BB6C')
  vim.cmd('highlight CmpItemKindConstructor   guibg=NONE guifg=#D4BB6C')
  vim.cmd('highlight CmpItemKindReference     guibg=NONE guifg=#D4BB6C')
  vim.cmd('highlight CmpItemKindFunction      guibg=NONE guifg=#A377BF')
  vim.cmd('highlight CmpItemKindStruct        guibg=NONE guifg=#A377BF')
  vim.cmd('highlight CmpItemKindClass         guibg=NONE guifg=#A377BF')
  vim.cmd('highlight CmpItemKindModule        guibg=NONE guifg=#A377BF')
  vim.cmd('highlight CmpItemKindOperator      guibg=NONE guifg=#A377BF')
  vim.cmd('highlight CmpItemKindVariable      guibg=NONE guifg=#7E8294')
  vim.cmd('highlight CmpItemKindFile          guibg=NONE guifg=#7E8294')
  vim.cmd('highlight CmpItemKindUnit          guibg=NONE guifg=#D4A959')
  vim.cmd('highlight CmpItemKindSnippet       guibg=NONE guifg=#D4A959')
  vim.cmd('highlight CmpItemKindFolder        guibg=NONE guifg=#D4A959')
  vim.cmd('highlight CmpItemKindMethod        guibg=NONE guifg=#6C8ED4')
  vim.cmd('highlight CmpItemKindValue         guibg=NONE guifg=#6C8ED4')
  vim.cmd('highlight CmpItemKindEnumMember    guibg=NONE guifg=#6C8ED4')
  vim.cmd('highlight CmpItemKindInterface     guibg=NONE guifg=#58B5A8')
  vim.cmd('highlight CmpItemKindColor         guibg=NONE guifg=#58B5A8')
  vim.cmd('highlight CmpItemKindTypeParameter guibg=NONE guifg=#58B5A8')

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

return config
