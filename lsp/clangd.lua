return {
  cmd = {
    'clangd',
    '--background-index',
    '--suggest-missing-includes',
    '--clang-tidy',
    '--header-insertion=never',
    '--compile-commands-dir=build',
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
  root_markers = {
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac', -- GNU Autotools.
  },
  reuse_client = function(client, config)
    return client.name == config.name
  end,
  settings = {
    clangd = {
      Completion = {
        CodePatterns = 'NONE',
      },
    },
  },
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true,
        completionItem = {
          snippetSupport = false,
        },
      },
    },
    -- Off-spec, but clangd and vim.lsp support UTF-8, which is more efficient.
    offsetEncoding = { 'utf-8', 'utf-16' },
  },
  on_init = function(client, init_result)
    if init_result.offsetEncoding then
      client.offset_encoding = init_result.offsetEncoding
    end
  end,

  -- Assumes at most one clangd client is attached to a buffer.
  on_attach = function(client, buf)
    vim.api.nvim_buf_create_user_command(buf, 'ClangdSwitchSourceHeader', function()
      --- Implements the off-spec textDocument/switchSourceHeader method.
      client:request(
        'textDocument/switchSourceHeader',
        vim.lsp.util.make_text_document_params(buf),
        function(err, result)
          if err then
            vim.notify(err.message, vim.log.levels.ERROR)
            return
          end
          if not result then
            vim.notify('Corresponding file could not be determined', vim.log.levels.WARN)
            return
          end
          vim.cmd.edit(vim.uri_to_fname(result))
        end
      )
    end, {
      bar = true,
      desc = 'clangd: Switch Between Source and Header File',
    })
    vim.keymap.set('n', 'gs', '<Cmd>ClangdSwitchSourceHeader<CR>', {
      buffer = buf,
      desc = 'clangd: Switch Between Source and Header File',
    })

    vim.api.nvim_create_autocmd('LspDetach', {
      group = vim.api.nvim_create_augroup('conf_lsp_attach_detach', { clear = false }),
      buffer = buf,
      callback = function(args)
        if args.data.client_id == client.id then
          vim.keymap.del('n', 'gs', { buffer = buf })
          vim.api.nvim_buf_del_user_command(buf, 'ClangdSwitchSourceHeader')
          return true -- Delete this autocmd.
        end
      end,
    })
  end,
} --[[@as vim.lsp.Config]]
