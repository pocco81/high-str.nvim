
local M = {}
local cmd = vim.cmd

local opts = require("high-str.config").options
local tool_verbosity = require("high-str.tools.tool-verbosity.init")

-- https://github.com/norcalli/nvim-colorizer.lua/blob/master/lua/colorizer.lua
-- https://stackoverflow.com/questions/596216/formula-to-determine-brightness-of-rgb-color
local function color_is_bright(r, g, b)
	-- Counting the perceptive luminance - human eye favors green color
	local luminance = (0.299*r + 0.587*g + 0.114*b)/255
	if luminance > 0.5 then
		return true -- Bright colors, black font
	else
		return false -- Dark colors, white font
	end
end

local function hex2rgb(hex)
    return tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))
end

function M.which_hi_group(hi_index)
	local index = math.floor(tonumber(hi_index))
	if (index >= 0 and index <= require("high-str.utils.general.tables").table_length(opts["highlight_colors"])) then
		return "DMHGroup"..index
	end
end

function M.parse_colors()
	for opt, _ in pairs(opts["highlight_colors"]) do
		local hi_color_bg = opts["highlight_colors"][opt][1]:gsub("color_", "")
		local hi_color_fg = opts["highlight_colors"][opt][2]:gsub("color_", "")
		local hi_num = opt:gsub("color_", "")
		local hi_name = "DMHGroup"..hi_num


		if (hi_color_fg == "smart") then
			local hex = hi_color_bg:gsub("#", "")
			local r = hex2rgb(string.sub(hex, 1, 2))
			local g = hex2rgb(string.sub(hex, 3, 4))
			local b = hex2rgb(string.sub(hex, 5, 6))


			if (color_is_bright(tonumber(r), tonumber(g), tonumber(b)) == true) then
				hi_color_fg = "#000000"
			else
				hi_color_fg = "#ffffff"
			end
		end

		tool_verbosity.verbose_print("highlight "..hi_name.." guifg="..hi_color_fg.." guibg="..hi_color_bg)
		cmd("highlight "..hi_name.." guifg="..hi_color_fg.." guibg="..hi_color_bg.."")
	end
end



return M

