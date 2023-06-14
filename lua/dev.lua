local M = {}

local info = require('core.util').info
local api = vim.api
local ts = vim.treesitter

local function get_func_info()
  local syntax_tree = ts.get_parser(0, 'c'):parse()[1]
  local root = syntax_tree:root()

  local query = ts.parse_query('c', '(function_definition) @func')
  local func_list = {}

  for _, captures, metadata in query:iter_matches(root, 0) do
    local start_row, start_col = captures[1]:start()

    local end_row = 0
    local end_col = 0
    local is_puc = true
    for i = 0, captures[1]:named_child_count() - 1 do
      local child = captures[1]:named_child(i)

      if child:type() == 'storage_class_specifier' then
        if ts.query.get_node_text(child, 0) == 'static' then
          is_puc = false
        end
      end

      if child:type() == 'function_declarator' then
        end_row, end_col = child:end_()
        break
      end
    end

    if end_row == end_col == 0 then
      goto continue
    end

    local func = api.nvim_buf_get_text(0, start_row, start_col, end_row, end_col, {nil})

    table.insert(func, is_puc)

    table.insert(func_list, func)

    ::continue::
  end

  return func_list
end

function M.setup()
  local func_list = get_func_info()

  if vim.tbl_isempty(func_list) then
    return
  end

  local funcs = {}

  for _, fn in ipairs(func_list) do
    table.insert(funcs, fn[1])
  end

  vim.ui.select(funcs, {}, function (_, idx)
    info(idx)
  end)
end

return M
