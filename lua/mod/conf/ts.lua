return function()
  local vts = vim.treesitter
  local ts = require('nvim-treesitter.configs')
  local tsutils = require('nvim-treesitter.ts_utils')

  ts.setup({
    auto_install = true,

    highlight = {
      enable = true,
      disable = { 'c', 'cpp' },
    },

    indent = {
      enable = true,
      disable = { 'c', 'cpp' },
    },
  })

  ---@keymap
  local bufnr = 0
  local node = nil
  local coord = nil
  local is_pair = false

  local function selection()
    ---@return nil|table<integer>
    local function get_coord()
      if node == nil then
        node = tsutils.get_node_at_cursor()
      elseif not is_pair then
        node = node:parent()
        if node == nil then
          return nil
        end
      end

      local lcoord = { vts.get_node_range(node) }
      local text = vts.get_node_text(node, bufnr)
      if not is_pair and text:find('^[%(%[{\'"]') ~= nil and text:find('[%)%]}\'"]$') ~= nil then
        is_pair = true
        lcoord = { lcoord[1] + 1, lcoord[2] + 1, lcoord[3] + 1, lcoord[4] - 2 }
      else
        is_pair = false
        lcoord = { lcoord[1] + 1, lcoord[2], lcoord[3] + 1, lcoord[4] - 1 }
      end

      if lcoord[4] == -1 then
        return nil
      end

      return lcoord
    end

    local lcoord
    repeat
      lcoord = get_coord()
    until not (
        coord
        and lcoord ~= nil
        and coord[1] == lcoord[1]
        and coord[2] == lcoord[2]
        and coord[3] == lcoord[3]
        and coord[4] == lcoord[4]
      )

    if lcoord == nil then
      return
    end

    coord = lcoord

    vim.api.nvim_win_set_cursor(0, { lcoord[1], lcoord[2] })
    vim.cmd('normal! o')
    vim.api.nvim_win_set_cursor(0, { lcoord[3], lcoord[4] })
  end

  map.n('<Cr>', function()
    node = tsutils.get_node_at_cursor()
    bufnr = vim.api.nvim_get_current_buf()

    vim.cmd({ cmd = 'normal', bang = true, args = { 'v' } }, {})

    selection()
  end)

  map.v('<Cr>', function()
    selection()
  end)
end
