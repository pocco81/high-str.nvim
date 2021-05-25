

local M = {}

local arguments = {
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9,
	0
}

function M.available_commands()
	return vim.tbl_keys(arguments)
end


return M
