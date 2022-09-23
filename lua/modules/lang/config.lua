local config = {}

function config.nvim_treesitter()
  vim.api.nvim_command('set foldmethod=expr')
  vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

  for _, conf in pairs(require('nvim-treesitter.parsers').get_parser_configs()) do
    conf.install_info.url = conf.install_info.url:gsub('https://github.com', 'https://hub.fastgit.org')
  end

  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'rust' },
    auto_install = true,
    highlight = { enable = true },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ['if'] = '@function.outer',    -- function() {...}
          ['ic'] = '@conditional.inner', -- if() {...}
          ['il'] = '@loop.inner',        -- for() {...}
          ['ip'] = '@parameter.inner',   -- , var,
          ['im'] = '@comment.outer',     -- /*  */
        },
      },
    },
  })
end

return config
