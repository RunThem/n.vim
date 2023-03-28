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

function config.trans()
  require('Trans').setup({
    hover = {
      animation = {
        open = 'fold',
        close = 'fold',
        interval = 1,
      },
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
    'rust',
  })

  require('easyformat').setup({
    fmt_on_save = false,
  })
end

function config.nvterm()
  require('nvterm').setup({
    terminals = {
      type_opts = {
        float = {
          row = 0.5,
          col = 0.1,
          width = 0.8,
          height = 0.4,
        },
      },
    },
  })
end

return config
