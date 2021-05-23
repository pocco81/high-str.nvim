

local M = {}

local cmd  = vim.cmd


function M.main(option, command_option)

	option = option or 0
	command_option = command_option or 0

	if (option == 0) then
	else
		cmd("echoerr 'Command was not recognized for DuckumentManners.nvim'")
	end
end


-- export the functions
return M
