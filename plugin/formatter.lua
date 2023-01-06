local api = vim.api

local function get_format_cmd()
  local fmt_tools = {
    c = 'clang-format -i',
    go = 'gofmt -w',
    lua = 'stylua --search-parent-directories -',
    cpp = 'clang-format -i',
    rust = 'rustfmt',
  }

  local ft = vim.bo.filetype
  if fmt_tools[ft] then
    return fmt_tools[ft] .. ' ' .. api.nvim_buf_get_name(0)
  end

  return nil
end

api.nvim_create_user_command('FormatCode', function()
  vim.cmd('w')
  vim.cmd('!' .. get_format_cmd())
end, {})

vim.keymap.set('n', '<Leader>F', '<cmd>:FormatCode<Cr>', { nowait = true, noremap = true, silent = true })
