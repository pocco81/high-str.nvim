

local M = {}

function M.which_hi_group(hi_index)
	if (hi_index >= 0 and hi_index <= 10) then
		return "DMHGroup"..hi_index
	end
end
