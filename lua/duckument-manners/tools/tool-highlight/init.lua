


local M = {}


local service = require("duckument-manners.tools.tool-highlight.service")

local function highlight(hi_index)
	service.highlight(hi_index)
end

local function rm_highlight()
	service.rm_highlight()
end

function M.main(option)
	-- option = color
	if not (option == "RmHighlight") then
		highlight(option)
	else
		rm_highlight()
	end
end



return M

