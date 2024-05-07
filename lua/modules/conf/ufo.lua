return function()
  local ufo = require('ufo')
  local promise = require('promise')

  -- vim.o.foldcolumn = '1' -- '0' is not bad
  -- vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
  -- vim.o.foldlevelstart = 99
  -- vim.o.foldenable = true

  local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ('%s %d'):format(string.rep(' ', 99 - util.line(lnum):len()), endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
      local chunkText = chunk[1]
      local chunkWidth = vim.fn.strdisplaywidth(chunkText)
      if targetWidth > curWidth + chunkWidth then
        table.insert(newVirtText, chunk)
      else
        chunkText = truncate(chunkText, targetWidth - curWidth)
        local hlGroup = chunk[2]
        table.insert(newVirtText, { chunkText, hlGroup })
        chunkWidth = vim.fn.strdisplaywidth(chunkText)
        -- str width returned from truncate() may less than 2nd argument, need padding
        if curWidth + chunkWidth < targetWidth then
          suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
        end
        break
      end
      curWidth = curWidth + chunkWidth
    end

    table.insert(newVirtText, { suffix, 'MoreMsg' })

    return newVirtText
  end

  --- lsp -> treesitter -> indent
  local selector = function(bufnr)
    local function handle_err(err, providerNmae)
      if type(err) == 'string' and err:match('UfoFallbackException') then
        return ufo.getFolds(bufnr, providerNmae)
      else
        return promise.reject()
      end
    end

    return ufo
      .getFolds(bufnr, 'lsp')
      :catch(function(err)
        return handle_err(err, 'treesitter')
      end)
      :catch(function(err)
        return handle_err(err, 'indent')
      end)
  end

  ufo.setup({
    fold_virt_text_handler = handler,
    provider_selector = function(bufnr, filetype, buftype)
      return selector
    end,
  })
end
