---@diagnostic disable: unused-local
M = {}
local H = {}

function M.run()
  local api = vim.api

  local bufnr = api.nvim_get_current_buf()
  local lines = api.nvim_buf_get_lines(bufnr, -2, -1, 0)
  local new_lines = {}
  local preview_buf_line = 0

  local line = 'return M   '
  -- for i, line in ipairs(lines) do
    H.printf(line)
    local startidx, endidx = string.find(line, '%s+$')
    H.printf(startidx)
    H.printf(endidx)
  -- end

end

function H.printf(tbl)
  local print_r_cache = {}
  local function sub_print_r(tbl_r, indent)
    if print_r_cache[tostring(tbl_r)] then
      print(indent .. '*' .. tostring(tbl_r))
    else
      print_r_cache[tostring(tbl_r)] = true
      if type(tbl_r) == 'table' then
        for pos, val in pairs(tbl_r) do
          if type(val) == 'table' then
            print(indent .. '[' .. pos .. '] => ' .. tostring(val) .. ' {')
            sub_print_r(val, indent .. string.rep(' ', string.len(pos) + 8))
            print(indent .. string.rep(' ', string.len(pos) + 6) .. '}')
          elseif type(val) == 'string' then
            print(indent .. '[' .. pos .. '] => "' .. val .. '"')
          else
            print(indent .. '[' .. pos .. '] => ' .. tostring(val))
          end
        end
      else
        print(indent .. tostring(tbl_r))
      end
    end
  end

  if type(tbl) == 'table' then
    print(tostring(tbl) .. ' {')
    sub_print_r(tbl, '  ')
    print('}')
  else
    sub_print_r(tbl, '  ')
  end
  print()
end

return M   
