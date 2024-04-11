local lsp_conf = {
  v_analyzer = {
    cmd = { 'v-analyzer' },
  },

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
      '--compile-commands-dir=build',
    },
  },

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

local function lsp_diagnostic()
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

local function lsp_capabilities(lsp)
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  if lsp == 'clangd' then
    -- capabilities.textDocument.completion.completionItem.snippetSupport = false
  end

  return capabilities
end

local function lsp_attach(lsp)
  return function(client, bufnr)
    if lsp ~= 'clangd' then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end
end

return function()
  local lspconfig = require('lspconfig')

  for lsp, conf in pairs(lsp_conf) do
    local defconf = {
      capabilities = lsp_capabilities(lsp),
      on_attach = lsp_attach(lsp),
      init_options = {
        usePlaceholders = true,
        completeUnimported = true,
      },
    }

    lspconfig[lsp].setup(vim.tbl_deep_extend('force', defconf, conf))
  end

  lsp_diagnostic()
end
