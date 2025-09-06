return function()
  local ft = require('guard.filetype')

  ft('c,cpp'):fmt({
    cmd = 'clang-format',
    stdin = true,
  }):lint({
    cmd = 'clang-tidy',
    args = { '--quiet', '-p', 'build' },
  })

  ft('go'):fmt({
    cmd = 'golines',
    args = { '-m', '120' },
    stdin = true,
  })

  ft('lua'):fmt({
    cmd = 'stylua',
    args = { '-' },
    stdin = true,
    find = '.stylua.toml',
  })

  ft('rust'):fmt({
    cmd = 'rustfmt',
    stdin = true,
  })

  ft('json'):fmt({
    cmd = 'json-fmt',
    stdin = true,
  })

  ---@keymap
  map.n('==', ':Guard fmt')
end
