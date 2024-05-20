return function()
  local saga = require('lspsaga')

  saga.setup({
    symbol_in_winbar = {
      enable = false,
    },
    outline = {
      win_width = 70,
      close_after_jump = true,
    },
  })
end
