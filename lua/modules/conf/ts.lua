return function()
  local ts = require('nvim-treesitter.configs')

  ts.setup({
    auto_install = true,
    highlight = {
      enable = true,
      disable = { 'c', 'cpp' },
    },
  })
end
