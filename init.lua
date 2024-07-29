--[[

  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

  Neovim init file
  Version: 1.8.0 - 2024/07/24
  Maintainer: RunThem
  Website: https://github.com/RunThem/n.vim.git

--]]

vim.g.mod = true

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

--]]
