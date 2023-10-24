return function()
  local lspconfig = require('lspconfig')

  local lsp_conf = {
    bashls = {},
    zls = {},
    vls = { cmd = { 'vls' } },

    gopls = {
      cmd = { 'gopls', '--remote=auto' },
      analyses = { unusedparams = true },
      staticcheck = true,
    },

    --- lua
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = {
            enable = false,
            globals = { 'vim', 'packer_plugins' },
          },
          runtime = { version = 'Lua 5.4' },
          workspace = {
            library = vim.api.nvim_get_runtime_file('', true),
            checkThirdParty = false,
          },
          completion = { keywordSnippet = 'Disable', callSnippet = 'Replace' },
        },
      },
    },

    clangd = {
      cmd = {
        'clangd',
        '--background-index',
        '--suggest-missing-includes',
        '--clang-tidy',
        '--header-insertion=never',
        '--compile-commands-dir=build/lsp',
      },
    },
    -- ccls = {
    --   cmd = { 'ccls' },
    --   init_options = {
    --     compilationDatabaseDirectory = 'build/lsp',
    --     index = {
    --       threads = 0,
    --     },
    --     clang = {
    --       excludeArgs = { '-frounding-math' },
    --     },
    --   },
    -- },

    rust_analyzer = {
      settings = {
        imports = {
          granularity = { group = 'module' },
          prefix = 'self',
        },
        cargo = {
          buildScripts = { enable = true },
        },
        procMacro = { enable = true },
      },
    },
  }

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

  local def_conf = {
    capabilities = vim.tbl_deep_extend(
      'force',
      vim.lsp.protocol.make_client_capabilities(),
      require('epo').register_cap()
    ),

    on_attach = function(client, bufnr) end,

    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
    },
  }

  for lsp, conf in pairs(lsp_conf) do
    lspconfig[lsp].setup(vim.tbl_deep_extend('force', def_conf, conf))
  end
end
