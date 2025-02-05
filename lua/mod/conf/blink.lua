return function()
  local blink = require('blink.cmp')

  blink.setup({
    keymap = {
      preset = 'enter',
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' },

      ['<Tab>'] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        'snippet_forward',
        'fallback',
      },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },

    completion = {
      trigger = { show_in_snippet = true },

      menu = {
        draw = { treesitter = { 'lsp' } },
      },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets' },
      cmdline = {},
    },
  })
end
