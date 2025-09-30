local fn = vim.fn

vim.diagnostic.config({
  signs = {
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
      [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
      [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
      [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
    },
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  -- virtual_text = true,
  -- virtual_lines = true,
})

local files = fn.glob(fn.stdpath('config') .. '/lsp/*.lua', false, true)

local langs = vim
  .iter(files)
  :map(function(file)
    return fn.fnamemodify(file, ':t:r')
  end)
  :totable()

vim.lsp.enable(langs)
