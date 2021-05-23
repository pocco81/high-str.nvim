

local M = {}

local arguments = {
	["soft"] = "soft",
	["hard"] = "hard"
}

function M.available_commands()
	return vim.tbl_keys(arguments)
end


return M
