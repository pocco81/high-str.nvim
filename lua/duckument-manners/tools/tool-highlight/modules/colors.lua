
local M = {}
local cmd = vim.cmd

local opts = require("duckument-manners.config").options


function M.which_hi_group(hi_index)
	local index = tonumber(hi_index)
	if (index >= 0 and index <= 10) then
		return "DMHGroup"..index
	end
end

function M.parse_colors()
	for opt, _ in pairs(opts["highlight"]) do
		local hi_num = opt:gsub("color_", "")
		local hi_name = "DMHGroup"..hi_num
		local hi_color = opts["highlight"][opt]

		cmd("echo 'highlight "..hi_name.." guibg="..hi_color.."'")

		if (opt == "color_0") then		-- background
			require("duckument-manners.tools.tool-highlight.modules.hi_utils").load_viml_funcs()
			local bkg_color = vim.api.nvim_eval("DMGetColor('Normal', 'bg#')")
			cmd('highlight '..hi_name.." guibg="..bkg_color.."")
		else
			cmd('highlight '..hi_name.." guibg="..hi_color.."")
		end
	end
end



return M

