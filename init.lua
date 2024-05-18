--[[

  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

  Neovim init file
  Version: 1.4.3 - 2024/05/19
  Maintainer: RunThem
  Website: https://github.com/RunThem/n.vim.git

--]]

require('core')

require('modules')

--[[ mini debug config

local function loadpkg(pkg_name, pkg_req)
  vim.opt.rtp:append(('%s/lazy/%s'):format(util.data_path(), pkg_name))
  return require(pkg_req)
end

local lsp = loadpkg('nvim-lspconfig', 'lspconfig')

--]]
