

local M = {}

local color_parse = require("duckument-manners.tools.tool-highlight.modules.color_parser")
local color_grabber = require("duckument-manners.tools.tool-highlight.modules.color_grabber")


function M.highlight(hi_index)

	color_parse.parse_colors()
	hi_group = color_grabber.which_hi_group(hi_index)

end


return M
