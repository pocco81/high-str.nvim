


local M = {}


local opts = require("high-str.config").options


function M.verbose_print(msg)
	if (opts["verbosity"] > 0) then
		vim.cmd("echo '"..msg.."'")
	end
end



return M

