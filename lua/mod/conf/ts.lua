return function()
  local ts = vim.treesitter
  local tc_configs = require('nvim-treesitter.configs')
  local ts_utils = require('nvim-treesitter.ts_utils')

  tc_configs.setup({
    auto_install = true,
    highlight = {
      enable = true,
      disable = { 'c', 'cpp' },
    },
    indent = {
      enable = true,
    },
  })

  ---@keymap
  local curr_node = nil
  local prev_node = nil
  local function selection(node, bufnr)
    if node == nil then
      return
    end

    local coord
    if
      vim.bo.filetype == 'c'
      and prev_node ~= nil
      and prev_node:type() ~= 'compound_statement'
      and node:type() == 'for_statement'
    then
      local start = { ts.get_node_range(node:child(1)) }
      local _end = { ts.get_node_range(node:child(5)) }

      coord = { start[1] + 1, start[2] + 1, _end[3] + 1, _end[4] - 1 }

      curr_node = prev_node
      prev_node = nil
    else
      coord = { ts.get_node_range(node) }

      local text = ts.get_node_text(node, bufnr)
      if text:find('^[%(%[{]') ~= nil and text:find('[%)%]}]$') ~= nil then
        coord = { coord[1] + 1, coord[2] + 1, coord[3] + 1, coord[4] - 2 }
      else
        coord = { coord[1] + 1, coord[2], coord[3] + 1, coord[4] - 1 }
      end
    end

    if coord[4] == -1 then
      return
    end

    vim.api.nvim_win_set_cursor(0, { coord[1], coord[2] })
    vim.cmd('normal! o')
    vim.api.nvim_win_set_cursor(0, { coord[3], coord[4] })
  end

  map.n('<Cr>', function()
    prev_node = nil
    curr_node = ts_utils.get_node_at_cursor()
    local bufnr = vim.api.nvim_get_current_buf()

    vim.cmd({ cmd = 'normal', bang = true, args = { 'v' } }, {})
    selection(curr_node, bufnr)
  end)

  map.v('<Cr>', function()
    if curr_node == nil or curr_node:parent() == nil then
      return
    end

    local parent = curr_node:parent()
    local bufnr = vim.api.nvim_get_current_buf()
    local text = { ts.get_node_text(curr_node, bufnr), ts.get_node_text(parent, bufnr) }

    text[3] = text[2]:sub(1, 1) .. text[1] .. text[2]:sub(text[2]:len())
    if text[1] == text[2] or text[3] == text[2] then
      parent = parent:parent()
    end

    prev_node = curr_node
    curr_node = parent
    selection(parent, bufnr)
  end)
end
