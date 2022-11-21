-- author: glepnr https://github.com/glepnir
-- date: 2022-10-22
-- License: MIT

local config = {}

function config.nvim_treesitter()
  vim.api.nvim_command('set foldmethod=expr')
  vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

  -- for _, conf in pairs(require('nvim-treesitter.parsers').get_parser_configs()) do
  --   conf.install_info.url = conf.install_info.url:gsub('https://github.com', 'https://hub.fastgit.org')
  -- end

  require('nvim-treesitter.configs').setup({
    -- ensure_installed = { 'c', 'cpp', 'go', 'lua', 'rust' },
    ensure_installed = 'all',
    auto_install = true,
    highlight = { enable = true },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ['if'] = '@function.outer', -- function() {...}
          ['ic'] = '@conditional.inner', -- if() {...}
          ['il'] = '@loop.inner', -- for() {...}
          ['ip'] = '@parameter.inner', -- , var,
          ['im'] = '@comment.outer', -- /*  */
        },
      },
    },
  })
end

function config.telescope()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd([[packadd plenary.nvim]])
    vim.cmd([[packadd telescope-fzy-native.nvim]])
  end
  local telescope = require('telescope')

  telescope.setup({
    defaults = {
      layout_config = {
        horizontal = { prompt_position = 'top', results_width = 0.6 },
        vertical = { mirror = false },
      },
      sorting_strategy = 'ascending',
      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    },
    pickers = {
      find_files = { theme = 'dropdown' },
      live_grep = { theme = 'dropdown' },
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
    },
  })

  telescope.load_extension('fzy_native')
end

function config.todo_comments()
  require('todo-comments').setup({
    keywords = {
      FIX = { alt = { 'FIX' } },
    },
    highlight = {
      before = 'fg',
      keyword = 'fg',
    },
    colors = {
      info = { 'LspDiagnosticsDefaultInformation', '#0DB0D7' },
    },
  })
end

function config.autopairs()
  local npairs = require('nvim-autopairs')
  local Rule = require('nvim-autopairs.rule')

  npairs.setup({ disable_filetype = { 'TelescopePrompt' } })

  npairs.add_rules({
    Rule(' ', ' '):with_pair(function(opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '{}' }, pair)
    end),
    Rule('{ ', ' }')
      :with_pair(function()
        return false
      end)
      :with_move(function(opts)
        return opts.prev_char:match('.%}') ~= nil
      end)
      :use_key('}'),
  })

  local status, cmp = pcall(require, 'cmp')
  if not status then
    vim.cmd([[packadd nvim-cmp]])
  end

  cmp = require('cmp')
  local pairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on('confirm_done', pairs.on_confirm_done({ map_char = { tex = '' } }))
end

function config.hop()
  local hop = require('hop')
  hop.setup({
    keys = 'etovxqpdygfblzhckisuran',
  })
end

return config
