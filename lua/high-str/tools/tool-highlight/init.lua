


local M = {}


local service = require("high-str.tools.tool-highlight.service")

local function highlight(hi_index)
	service.highlight(hi_index)
end

local function rm_highlight(to_rm)
	service.rm_highlight(to_rm)
end

function M.main(option)
	-- option = color
	if (option == "rm_all") then
		rm_highlight(option)
	else
		highlight(option)
	end
end



return M

