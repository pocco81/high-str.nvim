


local M = {}


local service = require("duckument-manners.tools.tool-highlight.service")

-- show and hide top funcs
local function highlight(hi_index)
	service.highlight(hi_index)
end

function M.main(option)
	-- option = color
	if not (option == "NONE") then
		highlight(option)
	end
end



return M

