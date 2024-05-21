local M = {}

local api, fn, ts, lpeg = vim.api, vim.fn, vim.treesitter, vim.lpeg
local inf = vim.print

local code = [[
  int main(int argc, const u_cstrt argv[]) {
  infln("%lu", sizeof(enum {T, F}));

#define range(i, s, e) for (size_t i = s; i < e; i++)

  range(i, 0, 16) {
    println("%zx_ is %zu", i, i * 16);
  }

  return EXIT_SUCCESS;

err:
  errln("failed.");

  return EXIT_FAILURE;
}]]

---@type table<string, tuple<string, string>>
local pair = {
  ['('] = { '%([^%(]*$', '%)' },
  ['['] = { '%[[^%[]*$', '%]' },
  ['{'] = { '{[^{]*$', '}' },
  ["'"] = { "'[^']*$", "'" },
  ['"'] = { '"[^"]*$', '"' },
}

---@param code string
---@param idx integer
local function find_min_pair(code, idx)
  local result = {}
  local tuple = { 1, code:len() }
  local code_l, code_r = code:sub(1, idx), code:sub(idx + 1)

  for k, v in pairs(pair) do
    local idx_l = code_l:find(v[1])
    local idx_r = code_r:find(v[2])
    if idx_l ~= nil and idx_r ~= nil then
      result[k] = { idx_l, idx_r + idx }
    end
  end

  local min_l, min_r = '', ''
  local minidx_l, minidx_r = 1, code:len()
  for k, v in pairs(result) do
    if v[1] > minidx_l then
      minidx_l = v[1]
      min_l = k
    end

    if v[2] < minidx_r then
      minidx_r = v[2]
      min_r = k
    end
  end

  if min_l ~= min_r then
    if idx - minidx_l < minidx_r - idx then
      tuple = result[min_l]
    else
      tuple = result[min_r]
    end
  else
    tuple = result[min_l]
  end

  return tuple
end

function M.setup()
  vim.cmd('messages clear')
  inf('Neovim Dev Output: ------------------------------------------------------------------------')

  -- local cor = code:find('sizeof')
  -- local tuple = find_min_pair(code, cor)
  --
  -- inf(tuple)
  -- inf(code:sub(tuple[1], tuple[2]))
end

return M
