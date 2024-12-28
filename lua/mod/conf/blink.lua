return function()
  local blink = require('blink.cmp')

  blink.setup({
    keymap = {
      preset = 'enter',
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' },
    },

    completion = {
      accept = { auto_brackets = { enabled = true } },

      trigger = {
        show_in_snippet = false,
        show_on_insert_on_trigger_character = false,
      },

      menu = {
        auto_show = true,
      },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets' },
      cmdline = {},
    },
  })
end
