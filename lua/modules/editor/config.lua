-- author: glepnr https://github.com/glepnir
-- date: 2022-10-22
-- License: MIT

local config = {
  ft = { 'c', 'cpp', 'go', 'sh', 'lua', 'rust', 'zig', 'scheme', 'v' },
}

-- config server in this function
function config.nvim_lsp()
  local signs = {
    Error = ' ',
    Warn = ' ',
    Info = ' ',
    Hint = ' ',
  }

  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  vim.diagnostic.config({
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    virtual_text = false,
  })

  local lspconfig = require('lspconfig')
  local def_conf = {
    on_attach = function(client, _)
      vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'

      client.server_capabilities.semanticTokensProvider = nil
    end,

    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
    },
  }

  for lsp, conf in pairs(require('modules.editor.lspconfig')) do
    local extended_opts = vim.tbl_deep_extend('force', def_conf, conf)

    lspconfig[lsp].setup(extended_opts)
  end
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
