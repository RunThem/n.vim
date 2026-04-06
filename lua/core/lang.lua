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

---@type string[]
local files = fn.glob(fn.stdpath('config') .. '/lsp/*.lua', false, true)

for _, f in ipairs(files) do
  vim.lsp.enable(fn.fnamemodify(f, ':t:r'))
end
