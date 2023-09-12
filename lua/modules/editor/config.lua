-- author: glepnr https://github.com/glepnir
-- date: 2022-10-22
-- License: MIT

local config = {
  ft = { 'c', 'cpp', 'go', 'sh', 'lua', 'rust', 'zig', 'scheme', 'v' },
}

-- config server in this function
function config.nvim_lsp()
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
    virtual_text = false,
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local on_attach = function(client, _)
    client.server_capabilities.semanticTokensProvider = nil
  end

  local def_conf = {
    capabilities = capabilities,
    on_attach = on_attach,
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

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

function config.cmp()
  local cmp = require('cmp')
  local lspkind = require('lspkind')
  local snippy = require('snippy')
  local autopairs = require('nvim-autopairs.completion.cmp')

  cmp.event:on('confirm_done', autopairs.on_confirm_done())

  require('modules.ui.config').cmp_hl()

  lspkind.init({
    symbol_map = { TypeParameter = ' ' },
  })

  local window = {
    completion = {
      winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
      col_offset = -2,
      side_padding = 0,
    },
  }

  local formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      local kind = lspkind.cmp_format({ mode = 'symbol_text', maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, '%s', { trimempty = true })
      kind.kind = ' ' .. strings[1] .. ' '

      return kind
    end,
  }

  local mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),

    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),

    ['<Up>'] = cmp.mapping.select_prev_item(),
    ['<Down>'] = cmp.mapping.select_next_item(),

    ['<C-e>'] = cmp.mapping.close(),
    ['<Cr>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),

    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif snippy.can_expand_or_advance() then
        snippy.expand_or_advance()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif snippy.can_jump(-1) then
        snippy.previous()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }

  local snippet = {
    expand = function(args)
      snippy.expand_snippet(args.body)
    end,
  }

  cmp.setup({
    preselect = cmp.PreselectMode.Item,
    window = window,
    formatting = formatting,
    mapping = mapping,
    snippet = snippet,
    sources = {
      { name = 'nvim_lsp' },
      { name = 'path' },
    },
    -- sorting = {
    -- comparators = {
    -- cmp.config.compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
    -- cmp.config.compare.offset,
    -- cmp.config.compare.exact,
    -- cmp.config.compare.kind,
    --compare.order,
    --compare.sort_text,
    -- compare.length,
    -- },
    -- },
  })
end

function config.treesitter()
  -- vim.api.nvim_command('set foldmethod=expr')
  -- vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

  -- for _, conf in pairs(require('nvim-treesitter.parsers').get_parser_configs()) do
  --   conf.install_info.url = conf.install_info.url:gsub('https://github.com', 'https://hub.fastgit.org')
  -- end

  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'rust', 'go' },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },

    rainbow = {
      enable = true,
      disable = { 'jsx', 'cpp' },
      query = 'rainbow-parens',
      strategy = require('ts-rainbow').strategy.global,
    },
  })
end

function config.autopairs()
  local npairs = require('nvim-autopairs')
  local Rule = require('nvim-autopairs.rule')

  require('nvim-autopairs').setup({})

  local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }

  npairs.add_rules({
    Rule(' ', ' '):with_pair(function(opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({
        brackets[1][1] .. brackets[1][2],
        brackets[2][1] .. brackets[2][2],
        brackets[3][1] .. brackets[3][2],
      }, pair)
    end),
  })

  for _, bracket in pairs(brackets) do
    npairs.add_rules({
      Rule(bracket[1] .. ' ', ' ' .. bracket[2])
        :with_pair(function()
          return false
        end)
        :with_move(function(opts)
          return opts.prev_char:match('.%' .. bracket[2]) ~= nil
        end)
        :use_key(bracket[2]),
    })
  end
end

return config
