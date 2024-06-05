return function()
  local guard = require('guard')
  local ft = require('guard.filetype')

  ft('c'):fmt('clang-format') -- :lint('clang-tidy')
  ft('cpp'):fmt('clang-format') -- :lint('clang-tidy')

  ft('rust'):fmt('rustfmt')

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

  guard.setup({
    fmt_on_save = false,
  })

  ---@keymap
  map.n('==', ':GuardFmt')
end
