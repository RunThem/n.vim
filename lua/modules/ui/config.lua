-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local config = {}

function config.porcelain()
  vim.cmd('colorscheme porcelain')

  local groups = {
    'Normal',
    'NormalNC',
    'NormalFloat',
    'FloatBorder',
    'Constant',
    'Special',
    'Identifier',
    'Statement',
    'PreProc',
    'Type',
    'Underlined',
    'Function',
    'Conditional',
    'Operator',
    'Structure',
    'NonText',
    'SignColumn',
    'EndOfBuffer',
  }

  for _, group in ipairs(groups) do
    vim.cmd(string.format('highlight %s guibg=NONE guifg=NONE', group))
  end

  vim.cmd('highlight LineNr                   guibg=NONE guifg=#61afaf')
  -- vim.cmd('highlight CursorLineNr             guibg=NONE guifg=#e95678')
  vim.cmd('highlight CursorLineNr             guibg=NONE guifg=#f8ab17')
  vim.cmd('highlight VertSplit                guibg=NONE guifg=#c98afa')
  vim.cmd('highlight Comment                  guibg=NONE guifg=#6a8ad9')
  vim.cmd('highlight TelescopeNormal          guibg=NONE guifg=#61afaf')
  vim.cmd('highlight ToggleTerm1Normal        guibg=NONE guifg=#61afaf')

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
end

function config.galaxyline()
  require('modules.ui.eviline')
end

function config.nvim_bufferline()
  require('bufferline').setup({
    options = {
      modified_icon = '✥',
      buffer_close_icon = '',
      always_show_bufferline = false,
      offsets = {
        filetype = 'NvimTree',
        text = 'File Explorer',
        highlight = 'Directory',
        text_align = 'left',
      },
    },
  })
end

return config
