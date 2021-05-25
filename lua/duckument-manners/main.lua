

local M = {}

local cmd  = vim.cmd

local tool_highlight = require("duckument-manners.tools.tool-highlight.init")
local tool_verbosity = require("duckument-manners.tools.tool-verbosity.init")



function M.main(option, command_option)

	option = option or 0
	command_option = command_option or "DEFAULT"

	if (option == 0) then
		tool_verbosity.verbose_print("Highlighting...")
		tool_highlight.main(command_option)
	else
		cmd("echo 'Command was not recognized for DuckumentManners.nvim'")
	end
end


return M

