return function()
  local blink = require('blink.cmp')

  blink.setup({
    keymap = { accept = { '<Tab>', '<Cr>' } },
    accept = { auto_brackets = { enabled = true } },
    trigger = {
      completion = { show_on_insert_on_trigger_character = false },
      signature_help = { enabled = true },
    },
    sources = { completion = { enabled_providers = { 'lsp', 'path', 'snippets' } } },
  })
end
