vim.api.nvim_create_user_command('VspCmdRun', function()
  local filepath = vim.fn.expand('%:p')  -- Absoluter Pfad zur aktuellen Datei
  local cmd_output = vim.fn.systemlist('python3 ' .. vim.fn.shellescape(filepath))

  vim.cmd('vnew')  -- neues vertikales Fenster mit leerem Buffer
  vim.api.nvim_buf_set_lines(0, 0, -1, false, cmd_output)

  vim.bo.buftype = 'nofile'
  vim.bo.bufhidden = 'wipe'
  vim.bo.swapfile = false

  vim.cmd('wincmd p')  -- zurück zum vorherigen Fenster
end, {})

