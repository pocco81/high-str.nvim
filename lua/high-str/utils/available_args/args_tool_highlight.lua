

local M = {}
local arguments = {}

local opts = require("high-str.config").options

function M.available_commands()
	for i=1, require("high-str.utils.general.tables").table_length(opts["highlight_colors"]), 1 do
		arguments[i-1]=i-1
	end

	return vim.tbl_keys(arguments)
end


return M
