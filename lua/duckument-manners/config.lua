

local config = {}


config.options = {
	highlight = {
		color_1 = "#DFFF00",	-- Chartreuse yellow
		color_2 = "#7FFFD4",	-- Aqua menthe
		color_3 = "#8A2BE2",	-- Proton purple
		color_4 = "#FF4500",	-- Orange red
		color_5 = "#008000",	-- Office green
		color_6 = "#0000FF",	-- Just blue
		color_7 = "#FFC0CB",	-- Blush pink
		color_8 = "#FFF9E3",	-- Cosmic latte
		color_9 = "#7d5c34",	-- Fallow brown
		color_0 = "#bkg",	-- Arsenic grey
	}
}


function config.set_options(opts)
    opts = opts or {}

    for opt, _ in pairs(opts) do

		-- check if option exists in the config's table
		if (config.options[opt] ~= nil) then		-- not nil

			-- chec if option is a table
			if (type(opts[opt]) == "table") then	-- if table
				for inner_opt, _ in pairs(opts[opt]) do

					-- table contains element by that key
					if (config.options[opt][inner_opt] ~= nil) then		-- not nil
						config.options[opt][inner_opt] = opts[opt][inner_opt]
					else		-- nil
						-- nothing
					end
				end
			else		-- if other
				config.options[opt] = opts[opt]
			end
		else		-- nil
			-- nothing
		end
	end
end




return config

