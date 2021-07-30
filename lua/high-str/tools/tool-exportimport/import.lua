local M = {}

local opts = require("high-str.config").options
local tbl_utils = require("high-str.utils.general.tables")
local hl_selection = require("high-str.tools.tool-highlight.modules.highlight_selection")


function M.load_file(sfile)
    local ftables, err = loadfile(sfile)
    if err then
        return _, err
    end
    local tables = ftables()
    for idx = 1, #tables do
        local tolinki = {}
        for i, v in pairs(tables[idx]) do
            if type(v) == "table" then
                tables[idx][i] = tables[v[1]]
            end
            if type(i) == "table" and tables[i[1]] then
                table.insert(tolinki, {i, tables[i[1]]})
            end
        end
        -- link indices
        for _, v in ipairs(tolinki) do
            tables[idx][v[2]], tables[idx][v[1]] = tables[idx][v[1]], nil
        end
    end
    return tables[1]
end

function M.import()

	local file_cords = M.load_file(opts.saving_path .. "cords.txt")
	local file = vim.fn.expand('%:p')

	if (tbl_utils.has_element(file_cords, file, "index") and file_cords ~= nil) then
		for hi, _ in pairs(file_cords[file]) do
			local hi_group = file_cords[file][hi]["hi_group"]
			local beg_line = file_cords[file][hi]["beg_line"]
			local beg_col = file_cords[file][hi]["beg_col"]
			local end_line = file_cords[file][hi]["end_line"]
			local end_col = file_cords[file][hi]["end_col"]

			hl_selection.highlight_visual_selection(hi_group, beg_line, beg_col, end_line, end_col)

		end
	else
		print("HighStr: couldn't import highlights for current file.")
	end

end

return M
