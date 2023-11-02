--[[
  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
Neovim init file
Version: 1.0.1 - 2023/11/02
Maintainer: RunThem
Website: https://github.com/RunThem/n.vim.git
--]]

require('core')

--[[ mini debug config

vim.opt.rtp:append('~/.local/share/nvim/lazy/nvim-lspconfig')
vim.opt.rtp:append('~/.local/share/nvim/lazy/epo.nvim')

vim.opt.completeopt = 'menu,menuone,noselect'

local epo = require('epo')
local lspconfig = require('lspconfig')

epo.setup({})
lspconfig['lua_ls'].setup({})

--]]
