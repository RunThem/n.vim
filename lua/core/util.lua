-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local util = {}
local home = os.getenv('HOME')
util.path_sep = package.config:sub(1, 1) == '\\' and '\\' or '/'

function util.get_config_path()
  local config = os.getenv('XDG_CONFIG_DIR')
  if not config then
    return home .. '/.config/nvim'
  end
  return config
end

function util.get_data_path()
  local data = os.getenv('XDG_DATA_DIR')
  if not data then
    return home .. '/.local/share/nvim'
  end
  return data
end

function util.info(tbl)
  local cache = {}
  local function sub_print_r(tbl_r, indent)
    local tbl_s = tostring(tbl_r)
    if cache[tbl_s] then
      print(indent .. '*' .. tbl_s)
    else
      cache[tbl_s] = true
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
        print(indent .. tbl_s)
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

return util
