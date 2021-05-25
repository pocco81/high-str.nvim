

local M = {}

local colors = require("duckument-manners.tools.tool-highlight.modules.colors")
local highlight_selection = require("duckument-manners.tools.tool-highlight.modules.colors.highlight_selection")


function M.highlight(hi_index)

	colors.parse_colors()
	local hi_group = colors.which_hi_group(hi_index)
	highlight_selection.highlight_visual_selection(hi_group)

end


return M
