local M = {}

local hs_util = require("high-str.utils.highlights_saver.save_highlights")
local opts = require("high-str.config").options
local tbl_utils = require("high-str.utils.general.tables")
local import = require("high-str.tools.tool-exportimport.import")

local function exportstring(s)
    return string.format("%q", s)
end

--// The Save Function
local function save_file(tbl, filename)
    local charS, charE = "   ", "\n"
    local file, err = io.open(filename, "wb")
    if err then
        return err
    end

    -- initiate variables for save procedure
    local tables, lookup = {tbl}, {[tbl] = 1}
    file:write("return {" .. charE)

    for idx, t in ipairs(tables) do
        file:write("-- Table: {" .. idx .. "}" .. charE)
        file:write("{" .. charE)
        local thandled = {}

        for i, v in ipairs(t) do
            thandled[i] = true
            local stype = type(v)
            -- only handle value
            if stype == "table" then
                if not lookup[v] then
                    table.insert(tables, v)
                    lookup[v] = #tables
                end
                file:write(charS .. "{" .. lookup[v] .. "}," .. charE)
            elseif stype == "string" then
                file:write(charS .. exportstring(v) .. "," .. charE)
            elseif stype == "number" then
                file:write(charS .. tostring(v) .. "," .. charE)
            end
        end

        for i, v in pairs(t) do
            -- escape handled values
            if (not thandled[i]) then
                local str = ""
                local stype = type(i)
                -- handle index
                if stype == "table" then
                    if not lookup[i] then
                        table.insert(tables, i)
                        lookup[i] = #tables
                    end
                    str = charS .. "[{" .. lookup[i] .. "}]="
                elseif stype == "string" then
                    str = charS .. "[" .. exportstring(i) .. "]="
                elseif stype == "number" then
                    str = charS .. "[" .. tostring(i) .. "]="
                end

                if str ~= "" then
                    stype = type(v)
                    -- handle value
                    if stype == "table" then
                        if not lookup[v] then
                            table.insert(tables, v)
                            lookup[v] = #tables
                        end
                        file:write(str .. "{" .. lookup[v] .. "}," .. charE)
                    elseif stype == "string" then
                        file:write(str .. exportstring(v) .. "," .. charE)
                    elseif stype == "number" then
                        file:write(str .. tostring(v) .. "," .. charE)
                    end
                end
            end
        end
        file:write("}," .. charE)
    end
    file:write("}")
    file:close()
end

function M.export()
    local cords = hs_util.get_highlights()

    if (next(cords) == nil) then
        print("HighStr: there are no highlights to save")
    else
		local file_cords = import.load_file(opts.saving_path .. "cords.txt") or {}
        local final_cords = {}

        if (next(file_cords) ~= nil) then
            final_cords = vim.tbl_deep_extend("force", file_cords, cords)
			for file, _ in pairs(final_cords) do
				for local_file, _ in pairs(cords) do
					if (file == local_file) then
						final_cords[file] = cords[local_file]
					end
				end
			end
        else
            final_cords = cords
        end

		save_file(final_cords, opts.saving_path .. "cords.txt")
    end
end

return M
