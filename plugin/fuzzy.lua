local function popup()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_keymap(buf, 't', '<ESC>', '<C-\\><C-c>', {})
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

  local lines = vim.api.nvim_get_option('lines')
  local columns = vim.api.nvim_get_option('columns')

  local opts = {
    relative = 'editor',
    style = 'minimal',
    row = lines - 17,
    col = 0,
    width = columns,
    height = 15,
    -- border = 'single',
  }

  local win = vim.api.nvim_open_win(buf, true, opts)
  return win, buf
end

local function execute(choices_cmd, on_selection)
  if vim.api.nvim_get_mode().mode == 'i' then
    vim.cmd('stopinsert')
  end
  local tmpfile = vim.fn.tempname()
  local shell = vim.api.nvim_get_option('shell')
  local shellcmdflag = vim.api.nvim_get_option('shellcmdflag')
  local popup_win, buf = popup()
  local height = vim.api.nvim_win_get_height(popup_win)
  local fzy = ''

  fzy = string.format('%s -p "_> " -l %d  > "%s"', choices_cmd, height, tmpfile)

  vim.api.nvim_create_autocmd({ 'TermOpen', 'BufEnter' }, {
    buffer = buf,
    command = 'startinsert!',
    once = true,
  })

  local args = { shell, shellcmdflag, fzy }

  vim.fn.termopen(args, {
    on_exit = function()
      -- popup could already be gone if user closes it manually; Ignore that case
      pcall(vim.api.nvim_win_close, popup_win, true)
      local contents = nil
      local file = io.open(tmpfile)
      if file then
        contents = file:read('*all')
        file:close()
        os.remove(tmpfile)
      end

      -- After on_exit there will be a terminal related cmdline update that would
      -- override any messages printed by the `on_selection` callback.
      -- The timer+schedule combo ensures users see messages printed within the callback
      local timer = vim.loop.new_timer()
      if timer then
        timer:start(0, 0, function()
          timer:stop()
          timer:close()
          vim.schedule(function()
            on_selection(contents)
          end)
        end)
      else
        on_selection(contents)
      end
    end,
  })
end

map.n('<Leader>ff', function()
  execute([[fd | fzy]], function(selection)
    if selection and vim.trim(selection) ~= '' then
      vim.cmd('e ' .. selection)
    end
  end)
end, { expr = false })

map.n('<Leader>fa', function()
  execute([[rg --no-heading --trim -nH . | fzy -S 50 -f "^(\w\.?\/?)+:[0-9]+:"]], function(selection)
    -- fzy returns search input if zero results found. This case is mapped to nil as well.
    selection = string.match(selection, '.+:%d+:')
    if selection then
      local parts = vim.split(selection, ':')

      vim.cmd(string.format('e +%d %s', parts[2], parts[1]))
    end
  end)
end, { expr = false })
