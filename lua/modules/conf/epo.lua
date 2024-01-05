return function()
  local kind_icon = {
    Text = '󰉿',
    Method = '',
    Function = '󰊕',
    Constructor = '',
    Field = '',
    Variable = '',
    Class = '',
    Interface = '',
    Module = '',
    Property = '',
    Unit = '',
    Value = '',
    Enum = '',
    Keyword = '',
    Snippet = '',
    Color = '',
    File = '',
    Reference = '',
    Folder = '',
    EnumMember = '',
    Constant = '',
    Struct = '',
    Event = '',
    Operator = '',
    TypeParameter = '',
    Unknown = '',
  }

  require('epo').setup({
    fuzzy = true,
    debounce = 50,
    signature = false,

    kind_format = function(k)
      return ' ' .. kind_icon[k]
    end,
  })

  -- for i, v in ipairs(symbols) do
  --   vim.lsp.protocol.CompletionItemKind[i] = v
  -- end
end
