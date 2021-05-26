

local M = {}
local arguments = {}

local opts = require("high-str.config").options


function M.available_commands()
	for i=0, require("high-str.utils.general.tables").table_length(opts["highlight_colors"]), 1 do
		table.insert(arguments, i)
	end

	return vim.tbl_keys(arguments)
end


return M
