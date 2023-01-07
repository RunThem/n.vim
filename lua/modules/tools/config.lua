-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local config = {}

function config.delaytrain()
  require('delaytrain').setup({
    grace_period = 3,
  })
end

return config
