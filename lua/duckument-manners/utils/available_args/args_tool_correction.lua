

local M = {}

local arguments = {
	["toggle"] = "toggle",
	["start"] = "soft",
	["stop"] = "hard"
}

function M.available_commands()
	return vim.tbl_keys(arguments)
end


return M

