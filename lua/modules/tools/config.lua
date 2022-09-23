-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local config = {}

function config.telescope()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd([[packadd plenary.nvim]])
    vim.cmd([[packadd popup.nvim]])
    vim.cmd([[packadd telescope-fzy-native.nvim]])
    vim.cmd([[packadd telescope-file-browser.nvim]])
  end
  require('telescope').setup({
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
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
    },
  })
  require('telescope').load_extension('fzy_native')
end

function config.kommentary()
  local kommentary = require('kommentary.config')

  kommentary.use_extended_mappings()
  kommentary.configure_language('default', { prefer_multi_line_comments = true })
end

function config.todo_comments()
  local todo = require('todo-comments')

  todo.setup {
    signs = true, -- show icons in the signs column
    keywords = {
      FIX = {
        icon = ' ',
        color = 'error',
        alt = { 'FIXME', 'BUG', 'FIXIT', 'FIX', 'ISSUE' }
      },
      TODO = { icon = ' ', color = 'info' },
      HACK = { icon = ' ', color = 'warning' },
      WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
      PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
      NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } }
    },
    highlight = {
      before = 'fg',
      keyword = 'fg',
      after = 'fg',
      pattern = [[.*<(KEYWORDS)\s*:]],
      comments_only = false
    },
    colors = {
      error = { 'LspDiagnosticsDefaultError', 'ErrorMsg', '#DC2626' },
      warning = { 'LspDiagnosticsDefaultWarning', 'WarningMsg', '#FBBF24' },
      info = { 'LspDiagnosticsDefaultInformation', '#0DB0D7' },
      hint = { 'LspDiagnosticsDefaultHint', '#10B981' },
      default = { 'Identifier', '#7C3AED' }
    },
    search = {
      command = 'fzf',
      args = {
        '--color=never', '--no-heading', '--with-filename', '--line-number',
        '--column'
      },
      -- regex that will be used to match keywords.
      -- don't replace the (KEYWORDS) placeholder
      pattern = [[\b(KEYWORDS):]] -- ripgrep regex
    }
  }
end

function config.autopairs()
  local npairs = require('nvim-autopairs')
  local Rule = require('nvim-autopairs.rule')

  npairs.setup({ disable_filetype = { 'TelescopePrompt' } })

  npairs.add_rules({
    Rule(' ', ' '):with_pair(function(opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '{}' }, pair)
    end), Rule('{ ', ' }'):with_pair(function()
      return false
    end):with_move(function(opts)
      return opts.prev_char:match('.%}') ~= nil
    end):use_key('}')
  })

  local status, cmp = pcall(require, 'cmp')
  if not status then
    vim.cmd([[packadd nvim-cmp]])
  end

  cmp = require('cmp')
  local pairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on('confirm_done', pairs.on_confirm_done({ map_char = { tex = '' } }))
end

function config.pretty_fold()
  require('pretty-fold').setup({
    sections = {
      left = {
        'content',
      },
      right = {
        ' ', 'number_of_folded_lines', ' ',
        function(config) return config.fill_char:rep(3) end
      }
    },
    fill_char = '•',
    remove_fold_markers = true,
    keep_indentation = true,
    process_comment_signs = 'spaces',
    comment_signs = {},
    stop_words = {
      '@brief%s*' -- (for C++) Remove '@brief' and all spaces after.
    },
    add_close_pattern = true, -- true, 'last_line' or false
    matchup_patterns = {
      {  '{', '}' },
      { '%(', ')' }, -- % to escape lua pattern char
      { '%[', ']' }, -- % to escape lua pattern char
    },
    ft_ignore = { 'neorg' }
  })
end

function config.mason()
  require('mason').setup({
    ui = {
      check_outdated_packages_on_open = true,
      border = "none",
      icons = {
        package_installed = "◍",
        package_pending = "◍",
        package_uninstalled = "◍"
      },
      keymaps = {
        -- Keymap to expand a package
        toggle_package_expand = "<CR>",
        -- Keymap to install the package under the current cursor position
        install_package = "i",
        -- Keymap to reinstall/update the package under the current cursor position
        update_package = "u",
        -- Keymap to check for new version for the package under the current cursor position
        check_package_version = "c",
        -- Keymap to update all installed packages
        update_all_packages = "U",
        -- Keymap to check which installed packages are outdated
        check_outdated_packages = "C",
        -- Keymap to uninstall a package
        uninstall_package = "X",
        -- Keymap to cancel a package installation
        cancel_installation = "<C-c>",
        -- Keymap to apply language filter
        apply_language_filter = "<C-f>"
      }
    },
    pip = { install_args = {} },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
    github = {
      download_url_template = "https://github.com/%s/releases/download/%s/%s"
    }
  })
end

function config.formatter()
  local conf = function(exe, args, stdin)
    return { exe = exe, args = args, stdin = stdin }
  end

  require('formatter').setup {
    filetype = {
      -- c = {
      --   function()
      --     return { exe = 'clang-format', args = { '-i' }, stdin = false }
      --   end
      -- },
      c = conf('clang-format', { '-i' }, false),
      cpp = conf('clang-format', { '-i' }, false),
      sh = conf('shfmt', { '-i' }, false),
      go = conf('gofmt', { '-w' }, false),
      rust = conf('rustfmt', {}, true),
      lua = conf('lua-format', { '-i', '-c', '~/.config/nvim/style.toml' }, true)
    }
  }
end

return config
