return function()
  local vts = vim.treesitter
  local ts = require('nvim-treesitter')

  ts.install({
    'c',
    'cpp',
    'python',
    'lua',
    'vim',
    'vimdoc',
    'markdown',
    'markdown_inline',
    'bash',
    'json',
    'yaml',
    'toml',
    'rust',
    'zig',
    'javascript',
    'typescript',
    'regex',
  }, { summary = false })

  util.autocmd({ 'FileType' }, {
    group = vim.api.nvim_create_augroup('TreesitterAttach', { clear = true }),
    callback = function(args)
      if vim.bo[args.buf].buftype ~= '' then
        return
      end

      local lang = vts.language.get_lang(args.match)
      if lang then
        if pcall(vts.start, args.buf, lang) then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end
    end,
  })

  ---@keymap
  local bufnr = 0
  ---@type TSNode|nil
  local node
  local coord
  local is_pair = false

  local function selection()
    ---@return nil|integer[]
    local function get_coord()
      if node == nil then
        node = vts.get_node()
      elseif not is_pair then
        node = node:parent()
      end

      if node == nil then
        return nil
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

    if lcoord == nil or #lcoord ~= 4 then
      return
    end

    coord = lcoord

    vim.api.nvim_win_set_cursor(0, { lcoord[1], lcoord[2] })
    vim.cmd('normal! o')
    vim.api.nvim_win_set_cursor(0, { lcoord[3], lcoord[4] })
  end

  map.n('<Cr>', function()
    node = vts.get_node()
    bufnr = vim.api.nvim_get_current_buf()

    vim.cmd('normal! v')

    selection()
  end)

  map.v('<Cr>', function()
    selection()
  end)
end
