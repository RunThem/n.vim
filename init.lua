--[[

  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

  Neovim init file
  Version: 2.6.0 - 2026/06/12
  Maintainer: RunThem
  Website: https://github.com/RunThem/n.vim.git

--]]

---@diagnostic disable: inject-field
---@diagnostic disable: need-check-nil
---@diagnostic disable: access-invisible

---@patch: neovim v0.13.0 has deprecated the function `_get_line_byte_from_position()`
vim.lsp.util._get_line_byte_from_position = function(bufnr, pos, encoding)
  return vim.pos.lsp(bufnr, pos, encoding)[1] + 1
end

require('core')

--[[ mini debug config
---@param name string
---@param repo? string
---@return nil|table
local function pkgload(name, repo)
  vim.opt.rtp:append(('%s/lazy/%s'):format(util.datapath(), name))
  return repo and require(repo) or nil
end

local lsp = pkgload('nvim-lspconfig', 'lspconfig')
local epo = pkgload('epo.nvim', 'epo')

lsp['lua_ls'].setup({
  settings = {
    Lua = {
      runtime = { version = 'Lua 5.4' },
      completion = { keywordSnippet = 'Disable', callSnippet = 'Replace' },
    },
  },
})

epo.setup({})

--]]
