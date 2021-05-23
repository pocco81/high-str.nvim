

local M = {}

local arguments = {
	[1] = "blue",
	[2] = "red",
	[3] = "green",
	[4] = "yellow",
	[5] = "purple",
	[6] = "black",
	[7] = "orange",
	[8] = "white",
	[9] = "pink",
	[0] = "cyan"
}

function M.available_commands()
	return vim.tbl_keys(arguments)
end


return M
