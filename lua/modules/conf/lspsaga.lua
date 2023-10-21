return function()
  local saga = require('lspsaga')

  saga.setup({
    symbol_in_winbar = {
      enable = false,
    },
  })
end
