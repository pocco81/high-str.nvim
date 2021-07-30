local M = {}

local opts = require("high-str.config").options
local utils_paths = require("high-str.utils.general.paths")

function M.setup(custom_opts)
    require("high-str.config").set_options(custom_opts)
end

local function create_saving_path()
    if (utils_paths.assert_dir(opts.saving_path) == 0) then
        fn.mkdir("" .. opts.saving_path .. "", "p")
    end
end

return M
