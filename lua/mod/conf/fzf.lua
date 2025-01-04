return function()
  local fzf = require('fzf-lua')

  fzf.setup({
    fzf_bin = 'sk',
    winopts = {
      height = 0.3,
      width = 1,
      row = 1,
      col = 0.5,

      title = 'finder',

      preview = { hidden = 'hidden' },

      on_create = function()
        vim.api.nvim_feedkeys('i', 'n', true)
      end,
    },
  })

  ---@keymap
  map.n('<Leader>ff', ':FzfLua files')
  map.n('<Leader>fa', ':FzfLua grep_project')
  map.n('<Leader>fw', ':FzfLua grep_cword')
  map.n('<Leader>fb', ':FzfLua grep_curbuf')
  map.n('<Leader>fl', ':FzfLua resume')
end
