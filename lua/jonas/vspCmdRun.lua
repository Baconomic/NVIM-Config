local term_win = nil  -- Speichert das Fenster mit dem Terminal

vim.api.nvim_create_user_command('VspCmdRun', function()
  local filepath = vim.fn.expand('%:p')
  local current_win = vim.api.nvim_get_current_win()

  -- Vorheriges Terminal-Fenster schließen, falls vorhanden
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_close(term_win, true)
    term_win = nil
  end

  -- Neues vertikales Split-Terminal öffnen
  vim.cmd('vsplit')
  vim.cmd('terminal python3 ' .. vim.fn.shellescape(filepath))

  -- Aktuelles Fenster (das Terminal) merken
  term_win = vim.api.nvim_get_current_win()

  -- Zurück zum ursprünglichen Fenster
  vim.api.nvim_set_current_win(current_win)
end, {})

