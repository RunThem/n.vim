-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT
-- recommend some vim mode key defines in this file

--- move to prev/next item in completion menuone
_G.smart_tab = function()
  if vim.fn.pumvisible() ~= 0 then
    return '<C-n><C-y>'
  else
    return '<Tab>'
  end
end

_G.smart_shift_tab = function()
  if vim.fn.pumvisible() ~= 0 then
    return '<C-p><C-y>'
  else
    return '<S-Tab>'
  end
end

_G.smart_enter = function()
  print('cr')
  local keys = {
    ['cr'] = vim.api.nvim_replace_termcodes('<CR>', true, true, true),
    ['ctrl-y'] = vim.api.nvim_replace_termcodes('<C-y>', true, true, true),
    ['ctrl-y_cr'] = vim.api.nvim_replace_termcodes('<C-y><CR>', true, true, true),
  }

  if vim.fn.pumvisible() ~= 0 then
    local item_selected = vim.fn.complete_info()['selected'] ~= -1
    return item_selected and keys['ctrl-y'] or keys['ctrl-y_cr']
    -- return '<C-y>()'
  else
    -- return '<Esc><Cr>'
    return keys['cr']
  end
end
