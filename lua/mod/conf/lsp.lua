local lsp_conf = {}

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
  vim.diagnostic.config({
    signs = {
      numhl = {
        [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
        [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
        [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
        [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
      },
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    virtual_text = false,
  })
end

local function make_capabilities(lsp)
  local capabilities = require('blink.cmp').get_lsp_capabilities({}, true)

  local _capabilities = {
    -- textDocument = {
    --   completion = {
    --     completionItem = {
    --       snippetSupport = false,
    --       resolveSupport = {
    --         properties = { 'edit', 'documentation', 'detail', 'additionalTextEdits' },
    --       },
    --     },
    --     completionList = {
    --       itemDefaults = {
    --         'editRange',
    --         'insertTextFormat',
    --         'insertTextMode',
    --         'data',
    --       },
    --     },
    --   },
    --   foldingRange = {
    --     dynamicRegistration = false,
    --     lineFoldingOnly = true,
    --   },
    -- },
  }

  capabilities = vim.tbl_deep_extend('force', capabilities, _capabilities)

  return capabilities
end

local function make_attach(lsp)
  return function(client, bufnr)
    if client.server_capabilities.inlayHintProvider then
      -- vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
  end
end

return function()
  local lspconfig = require('lspconfig')

  diagnostic()

  vim.iter(lsp_conf):each(function(lsp, conf)
    local defconf = {
      capabilities = make_capabilities(lsp),
      on_attach = make_attach(lsp),
      init_options = {
        usePlaceholders = true,
        completeUnimported = true,
      },
    }

    lspconfig[lsp].setup(vim.tbl_deep_extend('force', defconf, conf))
  end)
end
