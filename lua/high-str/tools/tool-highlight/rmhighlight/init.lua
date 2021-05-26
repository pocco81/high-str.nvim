


local M = {}


local service = require("high-str.tools.tool-highlight.service")

local function rm_highlight(to_rm)
	service.rm_highlight(to_rm)
end

function M.main(option)
	if not (option == "NONE") then
		rm_highlight(option)
	end
end



return M

