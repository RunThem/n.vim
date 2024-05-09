local g = vim.g

local function hl(name, var)
  vim.api.nvim_set_hl(0, name, var)
end

-- stylua: ignore start
local colors = {
  -- comment
  base01                = '#6e7171',
  base02                = '#363646',
  base03                = '#45465e',
  base04                = '#7C81A4',
  base05                = '#151626',
  base06                = '#16161D',
  -- bakcground
  -- 暗蓝紫
  bg                    = '#131824',
  --
  -- 莓红
  red                   = '#c45a65',
  dred                  = '#ed556a',
  -- blue
  qblue                 = '#4491d4',
  -- 晴蓝
  blue                  = '#7788d4',
  -- y远山蓝
  yslan                 = '#8fb2c9',
  --
  applegreen            = '#90a650',
  -- for sign
  wzgreen               = '#69a794',
  green                 = '#509987',
  --
  -- 海螺橙
  orange                = '#f0945d',
  -- 沙石黄#e5b751
  yellow                = '#e0af68',
  --
  voilet                = '#bc84a8',
  yjvoilet              = '#525288',
  dpvoilet              = '#957FB8',
  danlanzi              = '#a7a8bd',
  --
  aqua                  = '#55a6bd',
  --
  manaohui              = '#ccc9c6',
  ---
  notify_red            = '#BE3455',
  notify_yellow         = '#f4bc34',
  notify_blue           = '#1C95FC',
  notify_aqua           = '#46D9F2',
  bluelnum              = '#294161',
  non                   = 'NONE',
}

g.terminal_color_0 = colors.bg
g.terminal_color_1 = colors.red
g.terminal_color_2 = colors.applegreen
g.terminal_color_3 = colors.yellow
g.terminal_color_4 = colors.blue
g.terminal_color_5 = colors.violet
g.terminal_color_6 = colors.aqua
g.terminal_color_7 = colors.base06
g.terminal_color_8 = colors.base05
g.terminal_color_9 = colors.notify_red
g.terminal_color_10 = colors.green
g.terminal_color_11 = colors.notify_yellow
g.terminal_color_12 = colors.notify_blue
g.terminal_color_13 = colors.violet
g.terminal_color_14 = colors.notify_aqua
g.terminal_color_15 = colors.manaohui

--------------------------------------------------------
---@Neovim Relate
--------------------------------------------------------

hl('Normal',                              { })
hl('SignColumn',                          { })
hl('NormalFloat',                         { })
hl('NormalNC',                            { })
hl('FloatBorder',                         { })
hl('Special',                             { })
hl('Underlined',                          { })
hl('NonText',                             { })
hl('SignColumn',                          { })
hl('EndOfBuffer',                         { })
hl('TabLine',                             { })
hl('TabLineSel',                          { })
hl('StatusLine',                          { })
hl('StatusLineNC',                        { })

--- Buffer
hl('LineNr',                              { fg = colors.bluelnum })
hl('Search',                              { bg = colors.base04, fg = colors.base06 })
hl('Visual',                              { bg = colors.base03 })
hl('ColorColumn',                         { bg = colors.base06 })
hl('Whitespace',                          { fg = colors.base02 })

--- Window
hl('VertSplit',                           { fg = colors.base02 })
hl('Title',                               { fg = colors.yellow })

--- CursorWord
hl('CursorWord',                          { bg = colors.base02 })

--- Cursorline
hl('Cursorline',                          { bg = colors.non, undercurl = true })
hl('CursorLineNr',                        { fg = colors.qblue })

--- Pmenu
hl('Pmenu',                               { bg = colors.base03, fg = colors.manaohui })
hl('PmenuSel',                            { bg = colors.yellow, fg = colors.base06 })
hl('PmenuThumb',                          { bg = colors.base02 })
hl('PmenuKind',                           { bg = colors.base03, fg = colors.blue })
hl('PmenuKindSel',                        { link = 'PmenuSel' })
hl('PmenuExtra',                          { link = 'Pmenu' })
hl('PmenuExtraSel',                       { link = 'PmenuSel' })
hl('WildMenu',                            { link = 'pmenu' })

--- Statusline
hl('WinBar',                              { bg = colors.non })
hl('WinBarNC',                            { bg = colors.non })

--- Error
hl('ErrorMsg',                            { fg = colors.notify_red })

--- Markup
hl('TODO',                                { bg = colors.blue, fg = colors.base02 })
hl('Conceal',                             { fg = colors.green })
hl('Error',                               { fg = colors.notify_red })

--- Float
hl('FloatNormal',                         { link = 'Normal' })
hl('FloatShadow',                         { bg = colors.base06 })

--- Fold
hl('Folded',                              { fg = colors.yjvoilet })
hl('FoldColumn',                          { link = 'SignColumn' })

--- Spell
hl('SpellBad',                            { fg = colors.notify_red })
hl('SpellCap',                            { undercurl = true, sp = colors.notify_blue })
hl('SpellRare',                           { undercurl = true, sp = colors.voilet })
hl('SpellLocal',                          { undercurl = true, sp = colors.notify_aqua })

--- Msg
hl('WarningMsg',                          { fg = colors.notify_red })
hl('MoreMsg',                             { fg = colors.green })

--- Internal
hl('NvimInternalError',                   { fg = colors.notify_red })
hl('Directory',                           { fg = colors.blue })

--------------------------------------------------------
--- Langauge Relate
--------------------------------------------------------
--- Identifier
hl('Identifier',                          { fg = colors.yslan })
-- various variable names
hl('@variable',                           { fg = colors.yslan })
--built-in variable names (e.g. `this`)
hl('@variable.builtin',                   { fg = colors.red })
hl('@variable.parameter',                 { link = '@lsp.type.parameter' })
hl('Constant',                            { fg = colors.orange })
hl('@constant.builtin',                   { link = 'Constant' })
-- constants defined by the preprocessor
hl('@constant.macro',                     {})
--modules or namespaces
hl('@namespace',                          { link = 'Include' })
--symbols or atoms
-- ['@symbol'] = {},

--- Types
hl('Type',                                { fg = colors.blue })
hl('@type.builtin',                       { link = 'Type' })
--type definitions (e.g. `typedef` in C)
hl('@type.definition',                    { link = 'Type' })
--type qualifiers (e.g. `const`)
hl('@type.qualifier',                     { fg = colors.voilet, italic = true })
hl('@lsp.type.parameter',                 { fg = colors.red, italic = true })
hl('@lsp.type.label',                     { fg = colors.red, italic = true })
hl('@lsp.type.macro',                     { fg = '#957fb8', italic = true })
--modifiers that affect storage in memory or life-time like C `static`
hl('@storageclass',                       { fg = colors.voilet })
hl('@field',                              { fg = colors.wzgreen })
hl('@property',                           { fg = colors.wzgreen })

--- Keywords
hl('Keyword',                             { fg = colors.voilet })
hl('@keyword.function',                   { link = 'Keyword' })
hl('@keyword.return',                     { fg = colors.voilet, italic = true })
hl('@keyword.operator',                   { link = 'Operator' })
--if else
hl('Conditional',                         { fg = colors.dpvoilet })
--for while
hl('Repeat',                              { link = 'Conditional' })
hl('Debug',                               { fg = colors.red })
hl('Label',                               { fg = colors.voilet })
hl('PreProc',                             { fg = colors.dpvoilet })
hl('Include',                             { link = 'PreProc' })
hl('Exception',                           { fg = colors.voilet })
hl('Statement',                           { fg = colors.voilet })

--- Functions
hl('Function',                            { fg = colors.yellow })
--built-in functions
hl('@function.builtin',                   { fg = colors.qblue })
--function calls
hl('@function.call',                      { link = 'Function' })
--preprocessor macros
hl('@function.macro',                     { link = 'Function' })
hl('@method',                             { link = 'Function' })
hl('@method.call',                        { link = 'Function' })
hl('@constructor',                        { fg = colors.wzgreen })
hl('@parameter',                          { fg = colors.aqua })

--- Literals
hl('String',                              { fg = colors.applegreen })
hl('Number',                              { fg = colors.orange })
hl('Boolean',                             { fg = colors.orange })
hl('Float',                               { link = 'Number' })
--
hl('Define',                              { link = 'PreProc' })
hl('Operator',                            { fg = colors.red })
hl('Comment',                             { fg = colors.base01 })

--- Punctuation
hl('@punctuation.bracket',                { fg = '#7397ab' })
hl('@punctuation.delimiter',              { fg = '#7397ab' })

--- Tag
hl('@tag.html',                           { fg = colors.orange })
hl('@tag.attribute.html',                 { link = '@property' })
hl('@tag.delimiter.html',                 { link = '@punctuation.delimiter' })
hl('@tag.javascript',                     { link = '@tag.html' })
hl('@tag.attribute.javascript',           { link = '@tag.attribute.html' })
hl('@tag.delimiter.javascript',           { link = '@tag.delimiter.html' })
hl('@tag.typescript',                     { link = '@tag.html' })
hl('@tag.attribute.typescript',           { link = '@tag.attribute.html' })
hl('@tag.delimiter.typescript',           { link = '@tag.delimiter.html' })

--- Markdown
hl('@text.reference.markdown_inline',             { fg = colors.blue })

--- Diff
hl('DiffAdd',                             { fg = colors.green })
hl('DiffChange',                          { fg = colors.blue })
hl('DiffDelete',                          { fg = colors.red })
hl('DiffText',                            { fg = colors.red, bold = true })
hl('diffAdded',                           { fg = colors.green })
hl('diffRemoved',                         { fg = colors.red })
hl('diffChanged',                         { fg = colors.blue })
hl('diffOldFile',                         { fg = colors.yellow })
hl('diffNewFile',                         { fg = colors.orange })
hl('diffFile',                            { fg = colors.cyan })

--- Diagnostic
hl('DiagnosticError',                     { link = 'Error' })
hl('DiagnosticWarn',                      { fg = colors.notify_yellow })
hl('DiagnosticInfo',                      { fg = colors.notify_blue })
hl('DiagnosticHint',                      { fg = colors.notify_aqua })
hl('DiagnosticSignError',                 { link = 'DiagnosticError' })
hl('DiagnosticSignWarn',                  { link = 'DiagnosticWarn' })
hl('DiagnosticSignInfo',                  { link = 'DiagnosticInfo' })
hl('DiagnosticSignHint',                  { link = 'DiagnosticHint' })
hl('DiagnosticUnderlineError',            { undercurl = true, sp = colors.notify_red })
hl('DiagnosticUnderlineWarn',             { undercurl = true, sp = colors.notify_yellow })
hl('DiagnosticUnderlineInfo',             { undercurl = true, sp = colors.notify_blue })
hl('DiagnosticUnderlineHint',             { undercurl = true, sp = colors.notify_aqua })

--- Cmp
hl('CmpItemAbbr',                         { fg = colors.manaohui, bg = colors.non })
hl('CmpItemAbbrMatch',                    { fg = colors.green })
hl('CmpItemKind',                         { fg = colors.blue })
-- stylua: ignore end
