

local M = {}

local color_parse = require("duckument-manners.tools.tool-highlight.modules.colors.color_parser")
local color_grabber = require("duckument-manners.tools.tool-highlight.modules.colors.color_grabber")
local highlight_selection = require("duckument-manners.tools.tool-highlight.modules.colors.highlight_selection")


function M.highlight(hi_index)

	color_parse.parse_colors()
	hi_group = color_grabber.which_hi_group(hi_index)
	highlight_selection.highlight_visual_selection(hi_group)

end


return M
