

-- local opts = require("duckument-manners.config").options
-- local cmd = vim.cmd


local function setup_commands() end

function setup(custom_opts)
	require("duckument-manners.config").set_options(custom_opts)
end



return {
	setup = setup,
}

