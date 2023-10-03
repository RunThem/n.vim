return function()
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
