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

function config.guard()
  local ft = require('guard.filetype')

  ft('c'):lint('clang-tidy')

  ft('c'):fmt('clang-format')
  ft('go'):fmt('golines')
  ft('rust'):fmt('rustfmt')
  ft('lua'):fmt({
    cmd = 'stylua',
    args = { '--search-parent-directories', '-' },
  })

  require('guard').setup({})
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
