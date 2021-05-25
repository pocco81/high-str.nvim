

local M = {}

local opts = require("duckument-manners.config").options


function M.parse_colors()
	for opt, _ in pairs(opts["highlight"]) do
		local hi_num = opt:gsub(opt, "color_")
		local hi_name = "DMHGroup"..hi_num
		local hi_color = opts["highlight"][opt]

		if (opt == "color_0") then		-- background
			require("duckument-manners.tools.tool-highlight.modules.hi_utils").load_viml_funcs()
			local bkg_color = vim.api.nvim_eval("DMGetColor('Normal', 'bg#')")
			vim.cmd('highlight '..hi_name.." guibg="..bkg_color.."")
		else
			vim.cmd('highlight '..hi_name.." guibg="..hi_color.."")
		end
	end
end



return M

