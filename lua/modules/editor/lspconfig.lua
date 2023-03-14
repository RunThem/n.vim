local lspconfig = require('lspconfig')

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
  virtual_text = {
    source = true,
  },
})

local lsp_servers = {
  bashls = {},
  zls = {},
  gopls = {
    cmd = { 'gopls', '--remote=auto' },
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
    },
  },
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          enable = false,
          globals = { 'vim', 'packer_plugins' },
        },
        runtime = { version = 'LuaJIT' },
        workspace = {
          library = vim.list_extend({ [vim.fn.expand('$VIMRUNTIME/lua')] = true }, {}),
        },
      },
    },
  },
  -- clangd = {
  --   cmd = {
  --     'clangd',
  --     '--background-index',
  --     '--suggest-missing-includes',
  --     '--clang-tidy',
  --     '--header-insertion=iwyu',
  --   },
  -- },
  ccls = {},
  rust_analyzer = {
    settings = {
      imports = {
        granularity = {
          group = 'module',
        },
        prefix = 'self',
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
    },
  },
}

local all_conf = {
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client, _)
    vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'
    client.server_capabilities.semanticTokensProvider = nil
  end,
}

for lsp, _ in pairs(lsp_servers) do
  local extended_opts = vim.tbl_deep_extend('force', all_conf, lsp_servers[lsp])
  lspconfig[lsp].setup(extended_opts)
end

vim.diagnostic.config({
  virtual_text = false,
})
