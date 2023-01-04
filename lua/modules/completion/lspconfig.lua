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
  sumneko_lua = {
    settings = {
      Lua = {
        diagnostics = {
          enable = true,
          globals = { 'vim', 'packer_plugins' },
        },
        runtime = { version = 'LuaJIT' },
        workspace = {
          library = vim.list_extend({ [vim.fn.expand('$VIMRUNTIME/lua')] = true }, {}),
        },
      },
    },
  },
  clangd = {
    cmd = {
      'clangd',
      '--background-index',
      '--suggest-missing-includes',
      '--clang-tidy',
      '--header-insertion=iwyu',
    },
  },
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

local capabilities = vim.lsp.protocol.make_client_capabilities()
if not packer_plugins['cmp-nvim-lsp'].loaded then
  vim.cmd([[packadd cmp-nvim-lsp]])
end
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local opts = {
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

for lsp, _ in pairs(lsp_servers) do
  local extended_opts = vim.tbl_deep_extend('force', opts, lsp_servers[lsp] or {})
  lspconfig[lsp].setup(extended_opts)
end
