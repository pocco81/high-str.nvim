

local M = {}

function M.which_hi_group(hi_index)
	local index = tonumber(hi_index)
	if (index >= 0 and index <= 10) then
		return "DMHGroup"..index
	end
end

return M
