local opt = vim.opt

--- directory
local cache_dir = vim.env.HOME .. '/.cache/nvim/'
opt.swapfile = false
opt.undofile = true
opt.directory = cache_dir .. 'swap/'
opt.undodir = cache_dir .. 'undo/'
opt.backupdir = cache_dir .. 'backup/'
opt.viewdir = cache_dir .. 'view/'
opt.spellfile = cache_dir .. 'spell/en.uft-8.add'

--- encode
opt.fileencodings = 'utf-8,euc-cn,gb2312,gb18030,gbk,ucs-bom,cp936,latin1'

--- option
opt.viewoptions = 'folds,cursor,curdir,slash,unix'
opt.sessionoptions = 'curdir,help,tabpages,winsize'
opt.spelloptions = 'camel'
opt.virtualedit = 'all'
opt.clipboard = 'unnamedplus'
opt.ignorecase = true
opt.smartcase = true
opt.infercase = true
opt.timeoutlen = 500
opt.ttimeoutlen = 10
opt.updatetime = 100
opt.linebreak = true

opt.fillchars:append({ eob = ' ' })

--- ui
opt.termguicolors = true
opt.guicursor = 'a:ver1'
opt.completeopt = 'menu,menuone,noselect'
opt.shortmess = 'aoOTIcF'
opt.scrolloff = 7
opt.sidescrolloff = 5
opt.showtabline = 0
opt.winwidth = 30
opt.pumheight = 10
opt.laststatus = 3
opt.showmode = false
opt.list = true
-- opt.listchars = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←'
opt.listchars = 'tab: ·,nbsp: ,trail: ,extends: ,precedes: '
opt.breakindentopt = 'shift:2,min:20'
opt.showbreak = '↳  '
opt.foldlevelstart = 99
opt.foldmethod = 'expr'
opt.number = true
opt.statuscolumn = ' %l%= │ '
opt.signcolumn = 'yes'
opt.textwidth = 100
opt.colorcolumn = '100'
opt.concealcursor = 'niv'
opt.cursorline = true
-- opt.cursorcolumn = true

opt.smarttab = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2

--- use rg in vim grep
opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
opt.grepprg = 'rg --vimgrep --no-heading --smart-case'

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
