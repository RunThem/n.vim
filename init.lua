--[[

  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

  Neovim init file
  Version: 1.6.2 - 2024/05/23
  Maintainer: RunThem
  Website: https://github.com/RunThem/n.vim.git

--]]

vim.g.mod = true

require('core')

--[[ mini debug config

local function loadpkg(pkg_name, pkg_req)
  vim.opt.rtp:append(('%s/lazy/%s'):format(util.data_path(), pkg_name))
  return require(pkg_req)
end

local lsp = loadpkg('nvim-lspconfig', 'lspconfig')

--]]
