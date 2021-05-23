

local M = {}

local arguments = {
	["left"] = "left",
	["right"] = "right"
}

function M.available_commands_align()
	return vim.tbl_keys(arguments)
end


return M

