return function()
  require('epo').setup({
    fuzzy = true,
    debounce = 50,
    signature = false,
  })

  require('lspkind').init({
    mode = 'symbol',
    preset = 'codicons',

    symbol_map = {
      Text = '󰉿',
      Function = '󰊕',
      Constructor = '',
    },
  })
end
