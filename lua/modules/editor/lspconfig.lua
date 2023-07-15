return {
  --- shell
  bashls = {},

  --- zig
  zls = {},

  -- vlang
  vls = {
    cmd = { 'vls' },
  },

  --- golang
  gopls = {
    cmd = { 'gopls', '--remote=auto' },
    analyses = {
      unusedparams = true,
    },
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
        runtime = { version = 'LuaJIT' },
        workspace = {
          library = vim.list_extend({ [vim.fn.expand('$VIMRUNTIME/lua')] = true }, {}),
        },
      },
    },
  },

  --- c, cpp
  clangd = {
    cmd = {
      'clangd',
      '--background-index',
      '--suggest-missing-includes',
      '--clang-tidy',
      '--header-insertion=iwyu',
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

  --- rust
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
