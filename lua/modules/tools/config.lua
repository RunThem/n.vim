-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local config = {}

function config.todo_comments()
  require('todo-comments').setup({
    keywords = {
      FIX = { alt = { 'FIX' } },
    },
    highlight = {
      before = 'fg',
      keyword = 'fg',
    },
    colors = {
      info = { 'LspDiagnosticsDefaultInformation', '#0DB0D7' },
    },
  })
end

function config.easyformat()
  local configs = require('easyformat.config')

  configs.lua = {
    args = { '--search-parent-directories', '-' },
  }

  configs.use_default({
    'c',
    'cpp',
    'go',
    'rust',
  })

  require('easyformat').setup({
    fmt_on_save = false,
  })
end

function config.autoclose()
  require('autoclose').setup({
    options = {
      disable_when_touch = true,
      pair_spaces = true,
      auto_indent = true,
    },
  })
end

return config
