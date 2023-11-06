return function()
  local ts = require('nvim-treesitter.configs')

  ts.setup({
    highlight = {
      enable = true,
      disable = { 'c', 'cpp' },
    },
  })
end
