-- author: glepnr https://github.com/glepnir
-- date: 2023-01-04
-- License: MIT

local config = {}

function config.telescope()
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

function config.easyformat()
  require('easyformat').setup({
    fmt_on_save = false,
    c = {
      cmd = 'clang-format',
      args = { '-style=file', vim.api.nvim_buf_get_name(0) },
      find = '.clang-format',
      stdin = false,
      lsp = false,
    },
    cpp = {
      cmd = 'clang-format',
      args = { '-style=file', vim.api.nvim_buf_get_name(0) },
      find = '.clang-format',
      stdin = false,
      lsp = false,
    },
    lua = {
      cmd = 'stylua',
      find = '.stylua.toml',
      args = { '--search-parent-directories', '-' },
      stdin = true,
      lsp = false,
    },
  })
end

return config
