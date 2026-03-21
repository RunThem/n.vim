return function()
  local origami = require('origami')

  origami.setup({
    pauseFoldsOnSearch = true,
    foldtext = {
      enabled = true,
      padding = { width = 7 },
      lineCount = {
        template = '>>> (%d)', -- `%d` is replaced with the number of folded lines
        hlgroup = 'PmenuSel',
      },
      diagnosticsCount = true, -- uses hlgroups and icons from `vim.diagnostic.config().signs`
    },
    autoFold = {
      enabled = true,
      kinds = { 'imports' }, ---@type lsp.FoldingRangeKind[]
    },
    foldKeymaps = {
      setup = false,
    },
  })
end
