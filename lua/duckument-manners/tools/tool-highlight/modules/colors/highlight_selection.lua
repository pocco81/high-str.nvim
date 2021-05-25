

local M = {}

local api = vim.api
local cmd = vim.cmd

function M.highlight_visual_selection(hi_group)
	api.nvim_exec([[
		" Get the line and column of the visual selection marks
		let [beg_line, beg_col] = getpos("'<")[1:2]
		let [end_line, end_col] = getpos("'>")[1:2]
	]], false)

	local beg_line = api.nvim_eval([[get(g:,"beg_line", 0)]])
	local beg_col = api.nvim_eval([[get(g:,"beg_col", 0)]])
	local end_line = api.nvim_eval([[get(g:,"end_line", 0)]])
	local end_col = api.nvim_eval([[get(g:,"end_col", 0)]])
	local current_buffer = api.nvim_eval([[bufnr('%')]])


	if (beg_line == end_line) then
		api.nvim_buf_add_highlight(current_buffer, 0, hi_group, beg_line - 1, beg_col, end_col)
	else
			api.nvim_buf_add_highlight(current_buffer, 0, hi_group, beg_line - 1, beg_col, 2147483647)
		if (beg_line + 1 == end_line) then
			api.nvim_buf_add_highlight(current_buffer, 0, hi_group, beg_line, 0, end_col)
		elseif (beg_line - 1 == end_line) then
			api.nvim_buf_add_highlight(current_buffer, 0, hi_group, beg_line - 1, 0, end_col)
		end
	end

	-- cmd([[let cursor_pos_after = getpos(".")]])
	-- local after_pos_one
	-- api.nvim_exec([[
	-- 	let save_pos = getpos(".")
	-- 	call nvim_buf_add_highlight(bufnr('%'), 0, 'LineHighlight', beg_minus_one, save_pos[2] - 1, save_pos[2])
	-- ]], false)

end

return M



