return function()
  local epo = require('epo')

  epo.setup({
    fuzzy = true,
    debounce = 50,
    kind_format = function(k)
      return k:lower():sub(1, 1)
    end,
  })

  ---@keymap
  map.i('<Tab>', function()
    if vim.fn.pumvisible() == 1 then
      return '<C-n>'
    elseif vim.snippet.active({ direction = 1 }) then
      return '<Cmd>lua vim.snippet.jump(1)<Cr>'
    else
      return '<Tab>'
    end
  end, true)

  map.i('<S-Tab>', function()
    if vim.fn.pumvisible() == 1 then
      return '<C-p>'
    elseif vim.snippet.active({ direction = -1 }) then
      return '<Cmd>lua vim.snippet.jump(-1)<Cr>'
    else
      return '<S-Tab>'
    end
  end, true)

  map.i('<Cr>', function()
    if vim.fn.pumvisible() == 1 then
      return '<C-y>'
    end

    return '<Cr>'
  end, true)
end
