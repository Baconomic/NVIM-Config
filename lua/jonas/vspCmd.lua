vim.api.nvim_create_user_command('VspCmd', function(opts)
	local cmd_output = vim.fn.systemlist(opts.args)
	vim.cmd('vnew')
	vim.api.nvim_buf_set_lines(0,0,-1, false, cmd_output)
	vim.bo.buftype = 'nofile'
	vim.bo.bufhidden = 'wipe'
	vim.bo.swapfile = false
	vim.cmd('wincmd p')
end, { nargs = '+'})


