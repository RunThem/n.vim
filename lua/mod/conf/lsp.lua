local langs = {}

langs['clangd'] = {
  cmd = {
    'clangd',
    '--background-index',
    '--suggest-missing-includes',
    '--clang-tidy',
    '--header-insertion=never',
    '--compile-commands-dir=build',
  },
}

langs['v_analyzer'] = {
  cmd = { 'v-analyzer' },
}

langs['lua_ls'] = {
  settings = {
    Lua = {
      diagnostics = {
        -- enable = false,
        globals = { 'vim', 'packer_plugins' },
      },
      runtime = { version = 'Lua 5.4' },
      completion = { keywordSnippet = 'Disable', callSnippet = 'Replace' },
    },
  },
}

langs['gopls'] = {
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

langs['rust_analyzer'] = {
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

return function()
  local lspconfig = require('lspconfig')
  local blink = require('blink.cmp')
  local severity = vim.diagnostic.severity

  vim.diagnostic.config({
    signs = {
      numhl = {
        [severity.ERROR] = 'DiagnosticSignError',
        [severity.WARN] = 'DiagnosticSignWarn',
        [severity.INFO] = 'DiagnosticSignInfo',
        [severity.HINT] = 'DiagnosticSignHint',
      },
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    virtual_text = true,
  })

  vim.iter(langs):each(function(lang, conf)
    local capabilities = blink.get_lsp_capabilities({}, true)

    local attach = function(client, bufnr)
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end
    end

    local defconf = {
      capabilities = capabilities,
      on_attach = attach,
      init_options = {
        usePlaceholders = true,
        completeUnimported = true,
      },
    }

    lspconfig[lang].setup(vim.tbl_deep_extend('force', defconf, conf))
  end)
end
