local g = vim.g

local function hl(name, var)
  vim.api.nvim_set_hl(0, name, var)
end

-- stylua: ignore start
local H = {
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
  pair                  = '#7397ab',
  ---
  notify_red            = '#BE3455',
  notify_yellow         = '#f4bc34',
  notify_blue           = '#1C95FC',
  notify_aqua           = '#46D9F2',
  bluelnum              = '#497161',
  non                   = 'NONE',
}

g.terminal_color_0 = H.bg
g.terminal_color_1 = H.red
g.terminal_color_2 = H.applegreen
g.terminal_color_3 = H.yellow
g.terminal_color_4 = H.blue
g.terminal_color_5 = H.violet
g.terminal_color_6 = H.aqua
g.terminal_color_7 = H.base06
g.terminal_color_8 = H.base05
g.terminal_color_9 = H.notify_red
g.terminal_color_10 = H.green
g.terminal_color_11 = H.notify_yellow
g.terminal_color_12 = H.notify_blue
g.terminal_color_13 = H.violet
g.terminal_color_14 = H.notify_aqua
g.terminal_color_15 = H.manaohui

--------------------------------------------------------
---@Neovim Relate
--------------------------------------------------------
--- Base
hl('Normal',                              { })
hl('NormalFloat',                         { })
hl('NormalNC',                            { })
hl('FloatNormal',                         { })
hl('SignColumn',                          { })
hl('FoldColumn',                          { })
hl('FloatBorder',                         { })
hl('Special',                             { })
hl('Underlined',                          { })
hl('NonText',                             { })
hl('EndOfBuffer',                         { })
hl('TabLine',                             { })
hl('TabLineSel',                          { })
hl('StatusLine',                          { })
hl('StatusLineNC',                        { })

--- Buffer
hl('LineNr',                              { fg = H.bluelnum })
hl('Search',                              { bg = H.base04, fg = H.base06 })
hl('Visual',                              { bg = H.base03 })
hl('ColorColumn',                         { bg = H.base06 })
hl('Whitespace',                          { fg = H.base02 })

--- Window
hl('VertSplit',                           { fg = H.base02 })
hl('Title',                               { fg = H.yellow })

--- CursorWord
hl('CursorWord',                          { bg = H.base02 })

--- Cursorline
hl('Cursorline',                          { bg = H.non, undercurl = true })
hl('CursorLineNr',                        { fg = H.yslan, italic = true, bold = true })

--- Pmenu
hl('Pmenu',                               { bg = H.base03, fg = H.manaohui })
hl('PmenuSel',                            { bg = H.yellow, fg = H.base06 })
hl('PmenuThumb',                          { bg = H.base02 })
hl('PmenuKind',                           { bg = H.base03, fg = H.blue })
hl('PmenuKindSel',                        { bg = H.yellow, fg = H.base06 })
hl('PmenuExtra',                          { bg = H.base03, fg = H.manaohui })
hl('PmenuExtraSel',                       { bg = H.yellow, fg = H.base06 })
hl('WildMenu',                            { bg = H.base03, fg = H.manaohui })

--- Statusline
hl('WinBar',                              { bg = H.non })
hl('WinBarNC',                            { bg = H.non })

--- Error
hl('ErrorMsg',                            { fg = H.notify_red })

--- Markup
hl('TODO',                                { bg = H.blue, fg = H.base02 })
hl('Conceal',                             { fg = H.green })
hl('Error',                               { fg = H.notify_red })

--- Float
hl('FloatShadow',                         { bg = H.base06 })

--- Fold
hl('Folded',                              { fg = H.yjvoilet })

--- Spell
hl('SpellBad',                            { fg = H.notify_red })
hl('SpellCap',                            { undercurl = true, sp = H.notify_blue })
hl('SpellRare',                           { undercurl = true, sp = H.voilet })
hl('SpellLocal',                          { undercurl = true, sp = H.notify_aqua })

--- Msg
hl('WarningMsg',                          { fg = H.notify_red })
hl('MoreMsg',                             { fg = H.green })

--- Internal
hl('NvimInternalError',                   { fg = H.notify_red })
hl('Directory',                           { fg = H.blue })

--------------------------------------------------------
---@Langauge 
--------------------------------------------------------
hl('Boolean',                             { fg = H.orange })
hl('Comment',                             { fg = H.base01 })
hl('Constant',                            { fg = H.orange })
hl('Conditional',                         { fg = H.dpvoilet })
hl('Debug',                               { fg = H.red })
hl('Define',                              { fg = H.dpvoilet })
hl('Exception',                           { fg = H.voilet })
hl('Float',                               { fg = H.dpvoilet  })
hl('Function',                            { fg = H.yellow })
hl('Identifier',                          { fg = H.yslan })
hl('Include',                             { fg = H.dpvoilet })
hl('Keyword',                             { fg = H.voilet })
hl('Label',                               { fg = H.voilet })
hl('Number',                              { fg = H.orange })
hl('Operator',                            { fg = H.red })
hl('PreProc',                             { fg = H.dpvoilet })
hl('Paren',                               { fg = H.pair })
hl('Repeat',                              { fg = H.dpvoilet })
hl('Statement',                           { fg = H.voilet })
hl('String',                              { fg = H.applegreen })
hl('Type',                                { fg = H.blue })

--------------------------------------------------------
---@Tree-sitter 
--------------------------------------------------------
hl('@comment.todo.comment',               { fg = H.green })
hl('@constant.builtin',                   { fg = H.orange })
hl('@constant.macro',                     { })
hl('@constructor',                        { fg = H.wzgreen })
hl('@field',                              { fg = H.wzgreen })
hl('@function.builtin',                   { fg = H.qblue })
hl('@function.call',                      { fg = H.yellow })
hl('@function.macro',                     { fg = H.yellow })
hl('@keyword.function',                   { fg = H.voilet })
hl('@keyword.return',                     { fg = H.voilet, italic = true })
hl('@keyword.operator',                   { fg = H.red })
hl('@method',                             { fg = H.yellow })
hl('@method.call',                        { fg = H.yellow })
hl('@namespace',                          { fg = H.dpvoilet })
hl('@parameter',                          { fg = H.aqua })
hl('@property',                           { fg = H.wzgreen })
hl('@punctuation.bracket',                { fg = H.pair })
hl('@punctuation.delimiter',              { fg = H.pair })
hl('@storageclass',                       { fg = H.voilet })
hl('@type.builtin',                       { fg = H.blue })
hl('@type.definition',                    { fg = H.blue })
hl('@type.qualifier',                     { fg = H.voilet, italic = true })
hl('@variable',                           { fg = H.yslan })
hl('@variable.builtin',                   { fg = H.red })
hl('@variable.parameter',                 { fg = H.red, italic = true })

hl('@text.reference.markdown_inline',     { fg = H.blue })
hl('@tag.html',                           { fg = H.orange })
hl('@tag.attribute.html',                 { link = '@property' })
hl('@tag.delimiter.html',                 { link = '@punctuation.delimiter' })
hl('@tag.javascript',                     { link = '@tag.html' })
hl('@tag.attribute.javascript',           { link = '@tag.attribute.html' })
hl('@tag.delimiter.javascript',           { link = '@tag.delimiter.html' })
hl('@tag.typescript',                     { link = '@tag.html' })
hl('@tag.attribute.typescript',           { link = '@tag.attribute.html' })
hl('@tag.delimiter.typescript',           { link = '@tag.delimiter.html' })

--------------------------------------------------------
---@Lsp 
--------------------------------------------------------
hl('@lsp.type.parameter',                 { fg = H.red, italic = true })
hl('@lsp.type.label',                     { fg = H.red, italic = true })
hl('@lsp.type.macro',                     { fg = '#957fb8' })
hl('@lsp.type.comment',                   { link = 'Normal' })

--------------------------------------------------------
---@Diff 
--------------------------------------------------------
hl('DiffAdd',                             { fg = H.green })
hl('DiffChange',                          { fg = H.blue })
hl('DiffDelete',                          { fg = H.red })
hl('DiffText',                            { fg = H.red, bold = true })
hl('diffAdded',                           { fg = H.green })
hl('diffRemoved',                         { fg = H.red })
hl('diffChanged',                         { fg = H.blue })
hl('diffOldFile',                         { fg = H.yellow })
hl('diffNewFile',                         { fg = H.orange })
hl('diffFile',                            { fg = H.cyan })

--------------------------------------------------------
---@Diagnostic 
--------------------------------------------------------
hl('DiagnosticError',                     { fg = H.notify_red })
hl('DiagnosticWarn',                      { fg = H.notify_yellow })
hl('DiagnosticInfo',                      { fg = H.notify_blue })
hl('DiagnosticHint',                      { fg = H.notify_aqua })
hl('DiagnosticSignError',                 { fg = H.notify_red })
hl('DiagnosticSignWarn',                  { fg = H.notify_yellow })
hl('DiagnosticSignInfo',                  { fg = H.notify_blue })
hl('DiagnosticSignHint',                  { fg = H.notify_aqua })
hl('DiagnosticUnderlineError',            { undercurl = true, sp = H.notify_red })
hl('DiagnosticUnderlineWarn',             { undercurl = true, sp = H.notify_yellow })
hl('DiagnosticUnderlineInfo',             { undercurl = true, sp = H.notify_blue })
hl('DiagnosticUnderlineHint',             { undercurl = true, sp = H.notify_aqua })

--------------------------------------------------------
---@Cmp 
--------------------------------------------------------
hl('CmpItemAbbr',                         { fg = H.manaohui, bg = H.non })
hl('CmpItemAbbrMatch',                    { fg = H.green })
hl('CmpItemKind',                         { fg = H.blue })
-- stylua: ignore end

-- Fg = { fg = p.fg },
-- Grey = { fg = p.grey },
-- Red = { fg = p.red },
-- Orange = { fg = p.orange },
-- Yellow = { fg = p.yellow },
-- Green = { fg = p.green },
-- Blue = { fg = p.blue },
-- Purple = { fg = p.purple },
-- Normal = { fg = p.fg, bg = p.bg0 } + transparent_bg,
-- NormalNC = { fg = p.fg, bg = p.bg0 } + transparent_bg,
-- NormalSB = { fg = p.fg, bg = p.bg0 } + transparent_bg,
-- NormalFloat = { fg = p.fg, bg = p.bg0 } + transparent_bg,
-- Terminal = { fg = p.fg, bg = p.bg0 } + transparent_bg,
-- EndOfBuffer = { fg = p.bg2, bg = p.bg0 } + transparent_bg,
-- FoldColumn = { fg = p.fg, bg = p.bg1 } + transparent_bg,
-- Folded = { fg = p.fg, bg = p.bg1 } + transparent_bg,
-- SignColumn = { fg = p.fg, bg = p.bg0 } + transparent_bg,
-- ToolbarLine = { fg = p.fg },
-- Cursor = { reverse = true },
-- vCursor = { reverse = true },
-- iCursor = { reverse = true },
-- lCursor = { reverse = true },
-- CursorIM = { reverse = true },
-- CursorColumn = { bg = p.bg1 },
-- CursorLine = { bg = p.bg1 },
-- ColorColumn = { bg = p.bg1 },
-- CursorLineNr = { fg = p.fg },
-- LineNr = { fg = p.bg4 },
-- Conceal = { fg = p.grey, bg = p.bg1 } + transparent_bg,
-- DiffAdd = { fg = p.none, bg = p.diff_add },
-- DiffChange = { fg = p.none, bg = p.diff_change },
-- DiffDelete = { fg = p.none, bg = p.diff_delete },
-- DiffText = { fg = p.none, bg = p.diff_text },
-- Directory = { fg = p.green },
-- ErrorMsg = { fg = p.red, bold = true, underline = true },
-- WarningMsg = { fg = p.yellow, bold = true },
-- MoreMsg = { fg = p.blue, bold = true },
-- IncSearch = { fg = p.bg0, bg = p.bg_red },
-- Search = { fg = p.bg0, bg = p.bg_green },
-- CurSearch = { fg = p.bg0, bg = p.bg_red },
-- MatchParen = { fg = p.none, bg = p.bg4 },
-- NonText = { fg = p.bg4 },
-- Whitespace = { fg = p.bg4 },
-- SpecialKey = { fg = p.bg4 },
-- Pmenu = { fg = p.fg, bg = p.bg0 },
-- PmenuSbar = { fg = p.none, bg = p.bg0 },
-- PmenuSel = { fg = p.bg0, bg = p.bg_green },
-- PmenuThumb = { fg = p.none, bg = p.bg2 },
-- WildMenu = { fg = p.bg0, bg = p.blue },
-- Question = { fg = p.yellow },
-- SpellBad = { fg = p.red, underline = true, sp = p.red },
-- SpellCap = { fg = p.yellow, underline = true, sp = p.yellow },
-- SpellLocal = { fg = p.blue, underline = true, sp = p.blue },
-- SpellRare = { fg = p.purple, underline = true, sp = p.purple },
-- StatusLine = { fg = p.fg, bg = p.bg2 },
-- StatusLineTerm = { fg = p.fg, bg = p.bg2 },
-- StatusLineNC = { fg = p.grey, bg = p.bg1 },
-- StatusLineTermNC = { fg = p.grey, bg = p.bg1 },
-- TabLine = { fg = p.fg, bg = p.bg4 },
-- TabLineFill = { fg = p.grey, bg = p.bg1 },
-- TabLineSel = { fg = p.bg0, bg = p.bg_red },
-- WinSeparator = { fg = p.bg5 },
-- VertSplit = { fg = p.bg5 },
-- Visual = { bg = p.bg2 },
-- VisualNOS = { fg = p.none, bg = p.bg2, underline = true },
-- QuickFixLine = { fg = p.blue, underline = true },
-- Debug = { fg = p.yellow },
-- debugPC = { fg = p.bg0, bg = p.green },
-- debugBreakpoint = { fg = p.bg0, bg = p.red },
-- ToolbarButton = { fg = p.bg0, bg = p.bg_blue },
-- FocusedSymbol = { bg = p.bg3 },
-- FloatBorder = { fg = p.bg4 },
-- FloatTitle = { fg = p.blue },

-- Type = { fg = p.blue } + styles.keywords,
-- Structure = { fg = p.blue } + styles.keywords,
-- StorageClass = { fg = p.blue } + styles.keywords,
-- Identifier = { fg = p.orange } + styles.identifiers,
-- Constant = { fg = p.orange } + styles.variables,
-- PreProc = { fg = p.red },
-- PreCondit = { fg = p.red },
-- Include = { fg = p.red },
-- Keyword = { fg = p.red } + styles.keywords,
-- Define = { fg = p.red },
-- Typedef = { fg = p.red },
-- Exception = { fg = p.red },
-- Conditional = { fg = p.red },
-- Repeat = { fg = p.red },
-- Statement = { fg = p.red },
-- Macro = { fg = p.purple },
-- Error = { fg = p.red },
-- Label = { fg = p.purple },
-- Special = { fg = p.purple },
-- SpecialChar = { fg = p.purple },
-- Boolean = { fg = p.purple },
-- String = { fg = p.yellow },
-- Character = { fg = p.yellow },
-- Number = { fg = p.purple },
-- Float = { fg = p.purple },
-- Function = { fg = p.green } + styles.functions,
-- Operator = { fg = p.red },
-- Title = { fg = p.yellow },
-- Tag = { fg = p.orange },
-- Delimiter = { fg = p.fg },
-- Comment = { fg = p.bg4 } + styles.comments,
-- SpecialComment = { fg = p.bg4 } + styles.comments,
-- Todo = { fg = p.blue } + styles.comments,

-- treesitter
-- ["@annotation"] = { link = "PreProc", default = true },
-- ["@attribute"] = { link = "PreProc", default = true },
-- ["@boolean"] = { link = "Boolean", default = true },
-- ["@character"] = { link = "Character", default = true },
-- ["@character.special"] = { link = "SpecialChar", default = true },
-- ["@comment"] = { link = "Comment", default = true },
-- ["@conditional"] = { link = "Conditional", default = true },
-- ["@constant"] = { link = "Constant", default = true },
-- ["@constant.builtin"] = { link = "Special", default = true },
-- ["@constant.macro"] = { link = "Define", default = true },
-- ["@constructor"] = { link = "Special", default = true },
-- ["@debug"] = { link = "Debug", default = true },
-- ["@define"] = { link = "Define", default = true },
-- ["@defaultLibrary"] = { link = "Special", default = true },
-- ["@error"] = { link = "Error", default = true },
-- ["@exception"] = { link = "Exception", default = true },
-- ["@field"] = { link = "Identifier", default = true },
-- ["@float"] = { link = "Float", default = true },
-- ["@function"] = { link = "Function", default = true },
-- ["@function.builtin"] = { link = "Special", default = true },
-- ["@function.call"] = { link = "@function", default = true },
-- ["@function.macro"] = { link = "Macro", default = true },
-- ["@include"] = { link = "Include", default = true },
-- ["@keyword"] = { link = "Keyword", default = true },
-- ["@keyword.function"] = { link = "Keyword", default = true },
-- ["@keyword.operator"] = { link = "@operator", default = true },
-- ["@keyword.return"] = { link = "@keyword", default = true },
-- ["@label"] = { link = "Label", default = true },
-- ["@method"] = { link = "Function", default = true },
-- ["@method.call"] = { link = "@method", default = true },
-- ["@namespace"] = { link = "Include", default = true },
-- ["@none"] = { bg = "NONE", fg = "NONE", default = true },
-- ["@number"] = { link = "Number", default = true },
-- ["@operator"] = { link = "Operator", default = true },
-- ["@parameter"] = { link = "Identifier", default = true },
-- ["@parameter.reference"] = { link = "@parameter", default = true },
-- ["@preproc"] = { link = "PreProc", default = true },
-- ["@property"] = { link = "Identifier", default = true },
-- ["@punctuation.bracket"] = { link = "Delimiter", default = true },
-- ["@punctuation.delimiter"] = { link = "Delimiter", default = true },
-- ["@punctuation.special"] = { link = "Delimiter", default = true },
-- ["@repeat"] = { link = "Repeat", default = true },
-- ["@storageclass"] = { link = "StorageClass", default = true },
-- ["@string"] = { link = "String", default = true },
-- ["@string.escape"] = { link = "SpecialChar", default = true },
-- ["@string.regex"] = { link = "String", default = true },
-- ["@string.special"] = { link = "SpecialChar", default = true },
-- ["@symbol"] = { link = "Identifier", default = true },
-- ["@tag"] = { link = "Label", default = true },
-- ["@tag.attribute"] = { link = "@property", default = true },
-- ["@tag.delimiter"] = { link = "Delimiter", default = true },
-- ["@text"] = { link = "@none", default = true },
-- ["@text.danger"] = { link = "WarningMsg", default = true },
-- ["@text.emphasis"] = { italic = true, default = true },
-- ["@text.environment"] = { link = "Macro", default = true },
-- ["@text.environment.name"] = { link = "Type", default = true },
-- ["@text.literal"] = { link = "String", default = true },
-- ["@text.math"] = { link = "Special", default = true },
-- ["@text.note"] = { link = "SpecialComment", default = true },
-- ["@text.reference"] = { link = "Constant", default = true },
-- ["@text.strike"] = { strikethrough = true, default = true },
-- ["@text.strong"] = { bold = true, default = true },
-- ["@text.title"] = { link = "Title", default = true },
-- ["@text.todo"] = { link = "Todo", default = true },
-- ["@text.underline"] = { underline = true, default = true },
-- ["@text.uri"] = { link = "Underlined", default = true },
-- ["@text.warning"] = { link = "Todo", default = true },
-- ["@todo"] = { link = "Todo", default = true },
-- ["@type"] = { link = "Type", default = true },
-- ["@type.builtin"] = { link = "Type", default = true },
-- ["@type.definition"] = { link = "Typedef", default = true },
-- ["@type.qualifier"] = { link = "Type", default = true },
-- ["@variable"] = { fg = p.fg, default = true } + styles.variables,
-- ["@variable.builtin"] = { fg = p.purple, default = true },

-- lsp
-- LspCxxHlGroupEnumConstant = { fg = p.orange },
-- LspCxxHlGroupMemberVariable = { fg = p.orange },
-- LspCxxHlGroupNamespace = { fg = p.blue },
-- LspCxxHlSkippedRegion = { fg = p.grey },
-- LspCxxHlSkippedRegionBeginEnd = { fg = p.red },
-- LspDiagnosticsDefaultError = { fg = p.red + gamma(0.5) },
-- LspDiagnosticsDefaultHint = { fg = p.purple + gamma(0.5) },
-- LspDiagnosticsDefaultInformation = { fg = p.blue + gamma(0.5) },
-- LspDiagnosticsDefaultWarning = { fg = p.yellow + gamma(0.5) },
-- LspDiagnosticsUnderlineError = { underline = true, sp = p.red + gamma(0.5) },
-- LspDiagnosticsUnderlineHint = {
--     underline = true,
--     sp = p.purple + gamma(0.5),
-- },
-- LspDiagnosticsUnderlineInformation = {
--     underline = true,
--     sp = p.blue + gamma(0.5),
-- },
-- LspDiagnosticsUnderlineWarning = {
--     underline = true,
--     sp = p.yellow + gamma(0.5),
-- },
-- DiagnosticSignError = { fg = p.red + gamma(0.5) },
-- DiagnosticSignHint = { fg = p.purple + gamma(0.5) },
-- DiagnosticSignInfo = { fg = p.blue + gamma(0.5) },
-- DiagnosticSignWarn = { fg = p.yellow + gamma(0.5) },
-- LspReferenceRead = { bg = p.bg3 },
-- LspReferenceWrite = { bg = p.bg3 },
-- LspReferenceText = { bg = p.bg3 },
-- LspInfoBorder = { fg = p.bg4 },

-- lsp semantic tokens
-- LspNamespace = { link = "@namespace" },
-- LspType = { link = "@type" },
-- LspClass = { link = "@type" },
-- LspEnum = { link = "@constant" },
-- LspInterface = { link = "@constant" },
-- LspStruct = { link = "@constant" },
-- LspTypeParameter = { link = "@type" },
-- LspParameter = { link = "@parameter" },
-- LspVariable = { link = "@variable" },
-- LspProperty = { link = "@property" },
-- LspEnumMember = { link = "@constant" },
-- LspEvent = { link = "@constant" },
-- LspFunction = { link = "@function" },
-- LspMethod = { link = "@method" },
-- LspMacro = { link = "@constant.macro" },
-- LspKeyword = { link = "@keyword" },
-- LspModifier = { link = "TSModifier" },
-- LspComment = { link = "@comment" },
-- LspString = { link = "@string" },
-- LspNumber = { link = "@number" },
-- LspRegexp = { link = "@string.regex" },
-- LspOperator = { link = "@operator" },
-- LspDecorator = { link = "@symbol" },
-- LspDeprecated = { link = "@text.strike" },
-- ["@lsp.type.namespace"] = { link = "@namespace", default = true },
-- ["@lsp.type.type"] = { link = "@type", default = true },
-- ["@lsp.type.class"] = { link = "@type", default = true },
-- ["@lsp.type.enum"] = { link = "@type", default = true },
-- ["@lsp.type.interface"] = { link = "@type", default = true },
-- ["@lsp.type.struct"] = { link = "@structure", default = true },
-- ["@lsp.type.parameter"] = { link = "@parameter", default = true },
-- ["@lsp.type.variable"] = { link = "@variable", default = true },
-- ["@lsp.type.property"] = { link = "@property", default = true },
-- ["@lsp.type.enumMember"] = { link = "@constant", default = true },
-- ["@lsp.type.function"] = { link = "@function", default = true },
-- ["@lsp.type.method"] = { link = "@method", default = true },
-- ["@lsp.type.macro"] = { link = "@macro", default = true },
-- ["@lsp.type.decorator"] = { link = "@function", default = true },

-- markdown
-- markdownBlockquote = { fg = p.grey },
-- markdownBold = { fg = p.none, bold = true },
-- markdownBoldDelimiter = { fg = p.grey },
-- markdownCode = { fg = p.yellow },
-- markdownCodeBlock = { fg = p.yellow },
-- markdownCodeDelimiter = { fg = p.grey },
-- markdownH1 = { fg = p.yellow, bold = true },
-- markdownH2 = { fg = p.yellow, bold = true },
-- markdownH3 = { fg = p.yellow, bold = true },
-- markdownH4 = { fg = p.yellow, bold = true },
-- markdownH5 = { fg = p.yellow, bold = true },
-- markdownH6 = { fg = p.yellow, bold = true },
-- markdownHeadingDelimiter = { fg = p.grey },
-- markdownHeadingRule = { fg = p.grey },
-- markdownId = { fg = p.yellow },
-- markdownIdDeclaration = { fg = p.yellow },
-- markdownItalic = { fg = p.none, italic = true },
-- markdownItalicDelimiter = { fg = p.grey, italic = true },
-- markdownLinkDelimiter = { fg = p.grey },
-- markdownLinkText = { fg = p.purple, underline = true },
-- markdownLinkTextDelimiter = { fg = p.grey },
-- markdownListMarker = { fg = p.purple },
-- markdownOrderedListMarker = { fg = p.purple },
-- markdownRule = { fg = p.purple },
-- markdownUrl = { fg = p.blue, underline = true },
-- markdownUrlDelimiter = { fg = p.grey },
-- markdownUrlTitleDelimiter = { fg = p.purple },
-- ["@markup"] = { link = "@none" },
-- ["@markup.heading"] = { fg = p.yellow, bold = true },
-- ["@markup.link.label"] = { fg = p.purple, underline = true },
-- ["@markup.link.url"] = { fg = p.blue, underline = true },
-- ["@markup.list"] = { fg = p.purple },
-- ["@markup.list.checked"] = { fg = p.blue },
-- ["@markup.list.unchecked"] = { fg = p.blue },
-- ["@markup.strikethrough"] = { strikethrough = true },
-- ["@markup.strong"] = { bold = true },
-- ["@markup.italic"] = { italic = true },
-- ["@markup.underline"] = { underline = true },
