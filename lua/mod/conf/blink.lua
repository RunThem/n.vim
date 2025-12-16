return {
  ['cmp'] = function()
    local cmp = require('blink.cmp')

    cmp.setup({
      keymap = {
        preset = 'enter',
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },

        ['<Tab>'] = {
          function(self)
            if self.snippet_active() then
              return self.accept()
            else
              return self.select_and_accept()
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
      },

      cmdline = { enabled = false },
    })
  end,

  ['pairs'] = function()
    local pairs = require('blink.pairs')

    pairs.setup({})
  end,
}
