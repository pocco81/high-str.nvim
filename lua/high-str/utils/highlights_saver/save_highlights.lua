local M = {}

local list_cords = {}
local tbl_utils = require("high-str.utils.general.tables")

function M.get_highlights()
	return list_cords
end

function M.save(hi_group, beg_line, beg_col, end_line, end_col)
	local file = vim.fn.expand('%:p')

	if not (tbl_utils.has_element(list_cords, file, "index")) then
		list_cords[file] = {}
	end

	list_cords[file]["highlight_" .. tbl_utils.table_length(list_cords[file]) + 1] = {
		hi_group = hi_group,
		beg_line = beg_line,
		beg_col = beg_col,
		end_line = end_line,
		end_col = end_col
	}
end

return M
