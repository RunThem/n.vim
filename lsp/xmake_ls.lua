---@brief
---@type vim.lsp.Config
return {
  cmd = { 'xmake_ls' },
  filetypes = { 'lua' },
  root_markers = {
    'xmake.lua',
  },
  settings = {
    Lua = {},
  },
  workspace_required = false,
}
