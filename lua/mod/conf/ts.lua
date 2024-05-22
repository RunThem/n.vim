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
  })

  ---@keymap
  local node = nil
  map.n('<Cr>', function()
    local buf = vim.api.nvim_get_current_buf()
    node = ts_utils.get_node_at_cursor()

    local text = ts.get_node_text(node, buf)
    local corrd = { ts.get_node_range(node) }

    if text:find('^[%(%[{]') ~= nil and text:find('[%)%]}]$') ~= nil then
      corrd[2], corrd[4] = corrd[2] + 1, corrd[4] - 1
    end

    vim.cmd({ cmd = 'normal', bang = true, args = { 'v' } }, {})
    vim.api.nvim_win_set_cursor(0, { corrd[1] + 1, corrd[2] })
    vim.cmd('normal! o')
    vim.api.nvim_win_set_cursor(0, { corrd[3] + 1, corrd[4] - 1 })
  end)

  map.v('<Cr>', function()
    if node == nil then
      return
    end

    local buf = vim.api.nvim_get_current_buf()
    local text = { ts.get_node_text(node, buf), ts.get_node_text(node:parent(), buf) }

    if text[1] == text[2] or text[2]:sub(1, 1) .. text[1] .. text[2]:sub(text[2]:len()) == text[2] then
      node = node:parent()
    end

    node = node:parent()
    if node == nil then
      return
    end

    text = ts.get_node_text(node, buf)
    local corrd = { ts.get_node_range(node) }

    if text:find('^[%(%[{]') ~= nil and text:find('[%)%]}]$') ~= nil then
      corrd[2], corrd[4] = corrd[2] + 1, corrd[4] - 1
    end

    vim.api.nvim_win_set_cursor(0, { corrd[1] + 1, corrd[2] })
    vim.cmd('normal! o')
    vim.api.nvim_win_set_cursor(0, { corrd[3] + 1, corrd[4] - 1 })
  end)
end
