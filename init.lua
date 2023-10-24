--[[
  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
Neovim init file
Version: 0.15.1 - 2023/10/22
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

epo.setup({
  signature = false,
})

lspconfig['lua_ls'].setup({
  capabilities = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(), epo.register_cap()),
  on_attach = function(_, _) end,
})

--]]
