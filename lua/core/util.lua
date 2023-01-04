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

function util.info(msg)
  print(msg)
end

return util
