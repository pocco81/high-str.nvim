

local M = {}


local service = require("high-str.tools.tool-highlight.service")

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

