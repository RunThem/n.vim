return function()
  local blink = require('blink.cmp')

  blink.setup({
    keymap = {
      preset = 'enter',
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' },
    },

    accept = { auto_brackets = { enabled = true } },
    trigger = {
      completion = {
        keyword_range = 'full',
        show_on_insert_on_trigger_character = false,
        show_in_snippet = false,
      },
      signature_help = { enabled = true },
    },

    sources = {
      completion = { enabled_providers = { 'lsp', 'path', 'snippets' } },

      -- providers = {
      --   lsp = { score_offset = 4 },
      -- },
    },
  })
end
