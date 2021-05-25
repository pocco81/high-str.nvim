

local M = {}

local service = require("duckument-manners.tools.tool-highlight.service")
local cmd = vim.cmd

-- show and hide top funcs
local function highlight(hi_index)
	service.highlight(hi_index)
end

function M.main(option)

	-- option = color

	if not (option == "DEFAULT") then
		highlight(option)
	else
		highlight(1)
	end
end


-- vim.api.nvim_exec([[
-- 	augroup toggle_statusline
-- 		autocmd!
-- 		autocmd VimResume,FocusGained * lua resume()
-- 	augroup END
-- ]], false)


return M
