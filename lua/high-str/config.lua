local config = {}

config.options = {
    verbosity = 0,
	saving_path = "/tmp/highstr/",
    highlight_colors = {
        -- color_id = {"bg_hex_code",<"fg_hex_code"/"smart">}
        color_0 = {"#0c0d0e", "smart"}, -- Cosmic charcoal
        color_1 = {"#e5c07b", "smart"}, -- Pastel yellow
        color_2 = {"#7FFFD4", "smart"}, -- Aqua menthe
        color_3 = {"#8A2BE2", "smart"}, -- Proton purple
        color_4 = {"#FF4500", "smart"}, -- Orange red
        color_5 = {"#008000", "smart"}, -- Office green
        color_6 = {"#0000FF", "smart"}, -- Just blue
        color_7 = {"#FFC0CB", "smart"}, -- Blush pink
        color_8 = {"#FFF9E3", "smart"}, -- Cosmic latte
        color_9 = {"#7d5c34", "smart"} -- Fallow brown
    }
}

function config.set_options(opts)
    opts = opts or {}

    for opt, _ in pairs(opts) do
        if (config.options[opt] ~= nil) then -- not nil
            if (type(opts[opt]) == "table") then -- if table
                for inner_opt, _ in pairs(opts[opt]) do
                    if (type(opts[opt][inner_opt]) == "table") then -- if table
                        if (config.options[opt][inner_opt] == nil) then
                            config.options[opt][inner_opt] = opts[opt][inner_opt]
                        end

                        for inner_inner_opt, _ in pairs(opts[opt][inner_opt]) do
                            if (config.options[opt][inner_opt][inner_inner_opt] ~= nil) then -- not nil
                                config.options[opt][inner_opt][inner_inner_opt] = opts[opt][inner_opt][inner_inner_opt]
                            end
                        end
                    else
                        if (config.options[opt][inner_opt] ~= nil) then -- not nil
                            config.options[opt][inner_opt] = opts[opt][inner_opt]
                        end
                    end
                end
            else
                config.options[opt] = opts[opt]
            end
        end
    end
end

return config
