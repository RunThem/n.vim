return function()
  local guard = require('guard')
  local ft = require('guard.filetype')

  ft('c'):fmt('clang-format'):lint({
    cmd = 'clang-tidy',
    args = { '--quiet', '-p', 'build' },
  })

  ft('cpp'):fmt('clang-format'):lint({
    cmd = 'clang-tidy',
    args = { '--quiet', '-p', 'build' },
  })

  ft('go'):fmt({
    cmd = 'golines',
    args = { '-m', '120', '-t', '2' },
  })

  ft('lua'):fmt({
    cmd = 'stylua',
    args = { '--search-parent-directories', '-' },
  })

  ft('sh'):fmt({
    cmd = 'shfmt',
    args = { '-i', '2' },
  })

  ft('rust'):fmt({
    cmd = 'rustfmt',
  })

  guard.setup({
    fmt_on_save = false,
  })

  ---@keymap
  map.n('ff', ':GuardFmt')
end
