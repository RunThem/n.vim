return function()
  local guard = require('guard')
  local ft = require('guard.filetype')

  ft('c'):fmt({
    cmd = 'clang-format',
    args = { '-i' },
    fname = true,
  }):lint({
    cmd = 'clang-tidy',
    args = { '--quiet', '-p', 'build' },
  })

  ft('cpp'):fmt({
    cmd = 'clang-format',
    args = { '-i' },
    fname = true,
  }):lint({
    cmd = 'clang-tidy',
    args = { '--quiet', '-p', 'build' },
  })

  ft('go'):fmt({
    cmd = 'golines',
    args = { '-m', '120', '-w' },
    fname = true,
  })

  ft('lua'):fmt({
    cmd = 'stylua',
    args = { '-s' },
    fname = true,
  })

  ft('sh'):fmt({
    cmd = 'shfmt',
    args = { '-i', '2', '-w' },
    fname = true,
  })

  ft('rust'):fmt({
    cmd = 'rustfmt',
    fname = true,
  })

  ft('json'):fmt({
    cmd = 'json-fmt',
    args = { '-w' },
    fname = true,
  })

  vim.g.guard_config = { fmt_on_save = false }

  ---@keymap
  map.n('==', ':Guard fmt')
end
