-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local config = {}

function config.zephyr()
  vim.cmd('colorscheme zephyr')
  vim.cmd('highlight Normal guibg=NONE guifg=NONE')
  vim.cmd('highlight LineNr guibg=NONE guifg=#61afaf gui=italic')
  vim.cmd('highlight CursorLineNr guibg=NONE guifg=#e95678')
  vim.cmd('highlight SignColumn guibg=NONE')
  vim.cmd('highlight VertSplit guibg=NONE guifg=#c98afa')
  vim.cmd('highlight Comment gui=italic')
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
