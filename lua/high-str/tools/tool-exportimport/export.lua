local M = {}

local hs_util = require("high-str.utils.highlights_saver.save_highlights")
local opts = require("high-str.config").options
local tbl_utils = require("high-str.utils.general.tables")

local function write_table(t, f)
    local function write_table_helper(obj, cnt)
        local cnt = cnt or 0

        if type(obj) == "table" then
            io.write("\n", string.rep("\t", cnt), "{\n")
            cnt = cnt + 1

            for k, v in pairs(obj) do
                if type(k) == "string" then
                    io.write(string.rep("\t", cnt), '["' .. k .. '"]', " = ")
                end

                if type(k) == "number" then
                    io.write(string.rep("\t", cnt), "[" .. k .. "]", " = ")
                end

                write_table_helper(v, cnt)
                io.write(",\n")
            end

            cnt = cnt - 1
            io.write(string.rep("\t", cnt), "}")
        elseif type(obj) == "string" then
            io.write(string.format("%q", obj))
        else
            io.write(tostring(obj))
        end
    end

    if f == nil then
        write_table_helper(t)
    else
        io.output(f)
        io.write("return")
        write_table_helper(t)
        io.output(io.stdout)
    end
end

function M.export()
    local cords = hs_util.get_highlights()

    if (next(cords) == nil) then
        print("HighStr: there are no highlights to save")
    else
        local ok, file_cords = pcall(dofile, opts.saving_path .. "cords.txt")
        local final_cords = {}

        if (ok) then
            final_cords = vim.tbl_deep_extend("force", file_cords or {}, cords)
        else
            final_cords = cords
        end

        write_table(final_cords, opts.saving_path .. "cords.txt")
    end
end

return M
