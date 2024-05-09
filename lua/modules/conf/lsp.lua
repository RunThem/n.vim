local lsp_conf = {}

local clangd = true
if true then
  lsp_conf['clangd'] = {
    cmd = {
      'clangd',
      '--background-index',
      '--suggest-missing-includes',
      '--clang-tidy',
      '--header-insertion=never',
      '--compile-commands-dir=build',
    },
  }
else
  lsp_conf['ccls'] = {}
end

lsp_conf['v_analyzer'] = {
  cmd = { 'v-analyzer' },
}

lsp_conf['lua_ls'] = {
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
}

lsp_conf['gopls'] = {
  cmd = { 'gopls', '--remote=auto' },
  analyses = { unusedparams = true },
  staticcheck = true,
  settings = {
    gopls = {
      buildFlags = { '-tags', 'goexperiment.rangefunc' },
      env = {
        GOEXPERIMENT = 'rangefunc',
      },
    },
  },
}

lsp_conf['rust_analyzer'] = {
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
}

local function diagnostic()
  local signs = {
    -- Error = '',
    -- Warn = '',
    -- Info = '',
    -- Hint = '',

    Error = 'e',
    Warn = 'w',
    Info = 'i',
    Hint = 'h',
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
end

local function make_capabilities(lsp)
  local capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = vim.snippet and true or false,
          resolveSupport = {
            properties = { 'edit', 'documentation', 'detail', 'additionalTextEdits' },
          },
        },
        completionList = {
          itemDefaults = {
            'editRange',
            'insertTextFormat',
            'insertTextMode',
            'data',
          },
        },
      },
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      },
    },
  }

  capabilities = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(), capabilities)

  return capabilities
end

local function make_attach(lsp)
  return function(client, bufnr)
    -- if lsp ~= 'clangd' then
    --   client.server_capabilities.semanticTokensProvider = nil
    -- end
  end
end

return function()
  local lspconfig = require('lspconfig')
  local ts = require('nvim-treesitter.configs')
  local ts_conf = { auto_install = true, highlight = { enable = true } }

  if clangd then
    ts_conf.highlight.disable = { 'c', 'cpp' }
  end

  ts.setup(ts_conf)

  for lsp, conf in pairs(lsp_conf) do
    local defconf = {
      capabilities = make_capabilities(lsp),
      on_attach = make_attach(lsp),
      init_options = {
        usePlaceholders = true,
        completeUnimported = true,
      },
    }

    lspconfig[lsp].setup(vim.tbl_deep_extend('force', defconf, conf))
  end

  diagnostic()
end
