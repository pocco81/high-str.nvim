

local M = {}

local cmd  = vim.cmd

local tool_highlight = require("duckument-manners.tools.tool-highlight.init")



function M.main(option, command_option)

	option = option or 0
	command_option = command_option or "NONE"

	if (option == 0) then
		cmd("echo 'Align - "..tostring(command_option).."...'")
	elseif (option == 1) then
		cmd("echo 'Pencil - "..tostring(command_option).."...'")
	elseif (option == 2) then
		cmd("echo 'Highlight - "..tostring(command_option).."...'")
		tool_highlight.main(command_option)
	elseif (option == 3) then
		cmd("echo 'Bookmark - "..tostring(command_option).."...'")
	elseif (option == 4) then
		cmd("echo 'Correction - "..tostring(command_option).."...'")
	elseif (option == 5) then
		cmd("echo 'Repetition - "..tostring(command_option).."...'")
	else
		cmd("echo 'Command was not recognized for DuckumentManners.nvim'")
	end
end


return M

