--[[
  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
Neovim init file
Version: 1.0.0 - 2023/10/30
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

vim.keymap.set('i', '<c-e>', function()
  return vim.fn.pumvisible() == 1 and '<Esc>g_a' or '<C-e>'
end, { expr = true })
--]]
