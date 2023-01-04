-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local config = {}

function config.nvim_tree()
  require('nvim-tree').setup({
    disable_netrw = false,
    hijack_cursor = true,
    hijack_netrw = true,
  })
end

return config
