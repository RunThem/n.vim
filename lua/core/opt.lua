-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local opt = vim.opt
local cache_dir = vim.env.HOME .. '/.cache/nvim/'

opt.fileencodings = 'utf-8,euc-cn,gb2312,gb18030,gbk,ucs-bom,cp936,latin1'
opt.viewoptions = 'folds,cursor,curdir,slash,unix'
opt.sessionoptions = 'curdir,help,tabpages,winsize'

opt.termguicolors = true
opt.hidden = true
opt.magic = true
opt.virtualedit = 'all'
opt.guicursor = 'a:ver1'
opt.clipboard = 'unnamedplus'
opt.wildignorecase = true
opt.swapfile = false
opt.directory = cache_dir .. 'swap/'
opt.undodir = cache_dir .. 'undo/'
opt.backupdir = cache_dir .. 'backup/'
opt.viewdir = cache_dir .. 'view/'
opt.spellfile = cache_dir .. 'spell/en.uft-8.add'
opt.history = 2000
opt.timeout = true
opt.ttimeout = true
opt.timeoutlen = 500
opt.ttimeoutlen = 10
opt.updatetime = 100
opt.redrawtime = 1500
opt.ignorecase = true
opt.smartcase = true
opt.infercase = true

-- use rg in vim grep
if vim.fn.executable('rg') == 1 then
  opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
  opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
end

opt.completeopt = 'menu,menuone,noselect'
opt.showmode = false
opt.shortmess = 'aoOTIcF'
opt.scrolloff = 10
opt.sidescrolloff = 5
opt.ruler = false
opt.showtabline = 0
opt.winwidth = 30
opt.pumheight = 15
opt.showcmd = false
opt.cmdheight = 1
opt.laststatus = 3
opt.list = true
-- opt.listchars = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←'
opt.listchars = 'tab: ·,nbsp: ,trail: ,extends: ,precedes: '
opt.pumblend = 10
opt.winblend = 0
opt.undofile = true

opt.smarttab = true
opt.expandtab = true
opt.autoindent = true
opt.tabstop = 2
opt.shiftwidth = 2

-- wrap
opt.linebreak = true
opt.breakindentopt = 'shift:2,min:20'
opt.showbreak = '↳  '
opt.foldlevelstart = 99
opt.foldmethod = 'expr'

opt.number = true
opt.signcolumn = 'yes'
opt.spelloptions = 'camel'

opt.textwidth = 100
opt.colorcolumn = '100'
opt.conceallevel = 0
opt.concealcursor = 'niv'
opt.cursorline = true
opt.fillchars:append({ eob = ' ' })

if vim.loop.os_uname().sysname == 'Darwin' then
  vim.g.clipboard = {
    name = 'macOS-clipboard',
    copy = {
      ['+'] = 'pbcopy',
      ['*'] = 'pbcopy',
    },
    paste = {
      ['+'] = 'pbpaste',
      ['*'] = 'pbpaste',
    },
    cache_enabled = 0,
  }
  vim.g.python_host_prog = '/usr/bin/python'
  vim.g.python3_host_prog = '/usr/local/bin/python3'
end
