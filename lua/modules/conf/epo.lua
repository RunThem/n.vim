return function()
  require('epo').setup({
    fuzzy = true,
    debounce = 50,
    signature = false,
  })

  symbols = {
    '󰉿',
    '',
    '󰊕',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  }

  for i, v in ipairs(symbols) do
    vim.lsp.protocol.CompletionItemKind[i] = v
  end
end
