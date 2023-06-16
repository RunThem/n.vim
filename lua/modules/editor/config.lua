-- author: glepnr https://github.com/glepnir
-- date: 2022-10-22
-- License: MIT

local config = {
  ft = { 'c', 'cpp', 'go', 'sh', 'lua', 'rust', 'zig', 'scheme', 'v' },
}

-- config server in this function
function config.nvim_lsp()
  require('modules.editor.lspconfig')
end

function config.completion()
  require('mini.completion').setup({})
end

function config.treesitter()
  vim.api.nvim_command('set foldmethod=expr')
  vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

  -- for _, conf in pairs(require('nvim-treesitter.parsers').get_parser_configs()) do
  --   conf.install_info.url = conf.install_info.url:gsub('https://github.com', 'https://hub.fastgit.org')
  -- end

  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'rust', 'c', 'cpp', 'go' },
    auto_install = true,
    highlight = { enable = true },
  })
end

return config
