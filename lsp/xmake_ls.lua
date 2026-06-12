---@brief
---@type vim.lsp.Config
return {
  cmd = { 'xmake_ls' },
  filetypes = { 'lua' },
  root_markers = {
    'xmake.lua',
  },
  on_attach = function(client, _)
    if vim.fn.expand('%:t') ~= 'xmake.lua' then
      client.stop()
    end
  end,
  settings = {
    Lua = {},
  },
  workspace_required = true,
}
