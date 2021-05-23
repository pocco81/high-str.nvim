

local M = {}

local cmd  = vim.cmd


function M.available_commands_align()
	local arguments = require("duckument-manners.utils.available_args.args_tool_align")
	return vim.tbl_keys(arguments)
end

function M.main(option, command_option)

	option = option or 0
	command_option = command_option or 0

	if (option == 0) then
		cmd("echo 'Aligning document...'")
	else
		cmd("echoerr 'Command was not recognized for DuckumentManners.nvim'")
	end
end


-- export the functions
return M
