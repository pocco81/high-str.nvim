

local M = {}

local arguments = {
	["left"] = "left",
	["right"] = "right"
}

function M.available_commands()
	return vim.tbl_keys(arguments)
end


return M

