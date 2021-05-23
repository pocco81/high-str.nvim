

local config = {}


config.options = {}


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

