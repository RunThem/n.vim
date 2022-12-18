-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local config = {}

function config.zephyr()
  vim.cmd('colorscheme zephyr')

  local groups = {
    'Normal',
    'NormalNC',
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

  vim.cmd('highlight LineNr                guibg=NONE guifg=#61afaf')
  vim.cmd('highlight CursorLineNr          guibg=NONE guifg=#e95678')
  vim.cmd('highlight VertSplit             guibg=NONE guifg=#c98afa')
  vim.cmd('highlight Comment               guibg=NONE guifg=#6a8ad9')
  vim.cmd('highlight TelescopeNormal       guibg=NONE guifg=#61afaf')
  vim.cmd('highlight ToggleTerm1Normal     guibg=NONE guifg=#61afaf')
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
