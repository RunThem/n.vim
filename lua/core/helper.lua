-- author: glepnr https://github.com/glepnir
-- date: 2022-10-21
-- License: MIT

local helper = {}
local home = vim.env.HOME

function helper.get_config_path()
  local config = os.getenv('XDG_CONFIG_DIR')
  if not config then
    return home .. '/.config/nvim'
  end
  return config
end

function helper.get_data_path()
  local data = os.getenv('XDG_DATA_DIR')
  if not data then
    return home .. '/.local/share/nvim'
  end
  return data
end

function helper.get_cache_path()
  local cache = os.getenv('XDG_CACHE_DIR')
  if not cache then
    return home .. '/.cache/nvim/'
  end
end

function helper.exec(cmd)
  local result = assert(io.popen(cmd, 'r'))
  if result == nil then
    return
  end

  local out = result:read('*a')
  result:close()

  return string.sub(out, 0, string.len(out) - 1)
end

return helper
