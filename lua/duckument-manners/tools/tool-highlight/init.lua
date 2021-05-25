

local M = {}

local service = require("duckument-manners.tools.tool-highlight.service")
local cmd = vim.cmd

-- show and hide top funcs
local function highlight(hi_index)
	service.highlight(hi_index)
end

function M.main(option)

	-- option = color
	option = option or "NONE"

	if not (option == "NONE") then
		highlight(option)
	end
end


-- vim.api.nvim_exec([[
-- 	augroup toggle_statusline
-- 		autocmd!
-- 		autocmd VimResume,FocusGained * lua resume()
-- 	augroup END
-- ]], false)


return M
