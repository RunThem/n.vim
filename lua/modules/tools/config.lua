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

return config
