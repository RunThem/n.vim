--[[

  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

  Neovim init file
  Version: 1.3.1 - 2024/04/24
  Maintainer: RunThem
  Website: https://github.com/RunThem/n.vim.git

--]]

require('core')

require('modules')

--[[ mini debug config

vim.opt.rtp:append('~/.local/share/nvim/lazy/porcelain.nvim')
vim.opt.rtp:append('~/.local/share/nvim/lazy/nvim-lspconfig')
vim.opt.rtp:append('~/.local/share/nvim/lazy/nvim-web-devicons')
-- vim.opt.rtp:append('~/.local/share/nvim/whiskyline.nvim')

vim.opt.rtp:append('~/.config/nvim/whiskyline.nvim')

local whiskyline = require('whiskyline')
local lspconfig = require('lspconfig')

vim.cmd('colorscheme porcelain')

lspconfig['lua_ls'].setup({})
whiskyline.setup()

--]]
