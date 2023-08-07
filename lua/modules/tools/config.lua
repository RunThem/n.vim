-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local config = {}

function config.guard()
  local ft = require('guard.filetype')

  ft('c'):fmt('clang-format'):lint('clang-tidy')
  ft('cpp'):fmt('clang-format'):lint('clang-tidy')
  ft('rust'):fmt('rustfmt')

  ft('go'):fmt({ cmd = 'golines', args = { '-m', '120' } })
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
          height = 0.6,
        },
      },
    },
  })
end

return config
