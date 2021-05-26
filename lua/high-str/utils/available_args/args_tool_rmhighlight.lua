


local M = {}

local arguments = {
	rm_all = "rm_all"
}

function M.available_commands()
	return vim.tbl_keys(arguments)
end


return M
