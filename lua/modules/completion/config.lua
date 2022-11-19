-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local config = {}

-- config server in this function
function config.nvim_lsp()
  require('modules.completion.lspconfig')
end

function config.lspsaga()
  require('lspsaga').init_lsp_saga({})
end

function config.nvim_cmp()
  local cmp = require('cmp')
  local lspkind = require('lspkind')

  cmp.setup({
    preselect = cmp.PreselectMode.Item,
    window = {
      completion = {
        winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
        col_offset = -2,
        side_padding = 0,
      },
    },
    formatting = {
      fields = { 'kind', 'abbr', 'menu' },
      format = function(entry, vim_item)
        local kind = lspkind.cmp_format({ mode = 'symbol_text', maxwidth = 50 })(entry, vim_item)
        local strings = vim.split(kind.kind, '%s', { trimempty = true })
        kind.kind = ' ' .. strings[1] .. ''

        return kind
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-e>'] = cmp.config.disable,
      ['<Cr>'] = cmp.mapping.confirm({ select = true }),
    }),
    snippet = {
      expand = function(args)
        require('snippy').expand_snippet(args.body)
      end,
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'snippy' },
    },
  })
end

function config.snippy()
  require('snippy').setup({})
end

return config
