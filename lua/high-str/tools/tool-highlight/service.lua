local M = {}

local colors = require("high-str.tools.tool-highlight.modules.colors")
local highlight_selection = require("high-str.tools.tool-highlight.modules.highlight_selection")

function M.highlight(hi_index)
    colors.parse_colors()
    local hi_group = colors.which_hi_group(hi_index)
    highlight_selection.highlight_visual_selection(hi_group)
end

function M.rm_highlight(to_rm)
    highlight_selection.rm_highlight_visual_selection(to_rm)
end

return M
