return function()
  local blink = require('blink.cmp')

  local keymap = {
    ['<C-e>'] = { 'hide' },
    ['<Cr>'] = { 'accept', 'fallback' },

    ['<Tab>'] = {
      function(cmp)
        if cmp.is_in_snippet() then
          return cmp.accept()
        else
          return cmp.select_and_accept()
        end
      end,
      'snippet_forward',
      'fallback',
    },
    ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

    ['<Up>'] = { 'select_prev', 'fallback' },
    ['<Down>'] = { 'select_next', 'fallback' },
    ['<C-p>'] = { 'select_prev', 'fallback' },
    ['<C-n>'] = { 'select_next', 'fallback' },
    ['<C-k>'] = { 'select_prev', 'fallback' },
    ['<C-j>'] = { 'select_next', 'fallback' },
  }

  blink.setup({
    keymap = keymap,
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

      providers = {
        lsp = { score_offset = 4 },
      },
    },
  })
end
