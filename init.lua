--[[

  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

  Neovim init file
  Version: 2.7.0 - 2026/09/06
  Maintainer: RunThem
  Website: https://github.com/RunThem/n.vim.git

--]]

---@diagnostic disable: inject-field
---@diagnostic disable: need-check-nil
---@diagnostic disable: access-invisible
---@diagnostic disable: unresolved-require

---@patch: neovim v0.13.0 has deprecated the function `_get_line_byte_from_position()`
vim.lsp.util._get_line_byte_from_position = function(bufnr, pos, encoding)
  return vim.pos.lsp(bufnr, pos, encoding)[2]
end

vim.g.mod = true

require('core')

--[[ mini debug config

---@param args table
local function import(args)
  for _, v in ipairs(args['lsp']) do
    vim.lsp.enable(util.confpath('/lsp/' .. v .. '.lua'))
  end

  for _, v in ipairs(args['pkg']) do
    vim.opt.rtp:append(util.datapath('/lazy/' .. v))
  end
end

import({
  ['lsp'] = { 'emmylua_ls' },
  ['pkg'] = { 'blink.cmp' },
})

require('blink.cmp').setup({})

--]]
