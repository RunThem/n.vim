return function()
  local epo = require('epo')

  epo.setup({
    fuzzy = true,
    debounce = 50,
    signature = false,
  })
end
