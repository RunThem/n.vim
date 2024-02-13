_G.autocmd({ 'BufRead', 'BufNewFile' }, {
  group = n_vim_group,
  pattern = vim.env.HOME .. '/.config/nvim/*.lua',
  callback = function()
    local cmp = require('cmp')

    cmp.setup.buffer({
      sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'path' },
      },
    })
  end,
})

_G.autocmd({ 'BufRead', 'BufNewFile' }, {
  group = n_vim_group,
  pattern = 'xmake.lua',
  callback = function()
    local cmp = require('cmp')

    cmp.setup.buffer({
      sources = {
        { name = 'nvim_lsp' },
        { name = 'xmake' },
        { name = 'path' },
      },
    })
  end,
})

return function()
  local cmp = require('cmp')
  local lspkind = require('lspkind')
  local snippy = require('snippy')
  local autopairs = require('nvim-autopairs.completion.cmp')

  cmp.event:on('confirm_done', autopairs.on_confirm_done())

  lspkind.init({
    symbol_map = {
      Text = '󰉿',
      Method = '',
      Function = '󰊕',
      Constructor = '',
      Field = '',
      Variable = '',
      Class = '',
      Interface = '',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '',
      Keyword = '',
      Snippet = '',
      Color = '',
      File = '',
      Reference = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = '',
      Event = '',
      Operator = '',
      TypeParameter = '',
      Unknown = '',
    },
  })

  local window = {
    completion = {
      winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
      col_offset = -3,
      side_padding = 0,
    },
  }

  local formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      local item = lspkind.cmp_format({ mode = 'symbol_text', maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(item.kind, '%s', { trimempty = true })

      item.kind = ' ' .. strings[1] .. ' '
      item.abbr = string.gsub(item.abbr, '^%s', '')

      return item
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
