local M = {}

function M.setup(custom_opts)
    require("high-str.config").set_options(custom_opts)
end

return M
