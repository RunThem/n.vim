--[[

  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

  Neovim init file
  Version: 2.0.0 - 2025/02/05
  Maintainer: RunThem
  Website: https://github.com/RunThem/n.vim.git

--]]

vim.g.mod = true
vim.g.cmp = 'blink'

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
