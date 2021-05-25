

local M = {}

local api = vim.api
local cmd = vim.cmd


local function get_cols(num) return api.nvim_eval("col(["..num..", '$'])") end

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

	cmd("echo 'beg_line: "..beg_line.."; beg_col: "..beg_col.."; end_line: "..end_line.."; end_col: "..end_col.."'")

	if (beg_line == end_line) then
		api.nvim_buf_add_highlight(current_buffer, 0, hi_group, beg_line - 1, beg_col, end_col)
	else

		api.nvim_buf_clear_namespace(current_buffer, 0, beg_line - 1, beg_line)
		api.nvim_buf_add_highlight(current_buffer, 0, hi_group, beg_line - 1, beg_col, get_cols(beg_line) - 1)

		if (beg_line + 1 == end_line) then
			api.nvim_buf_add_highlight(current_buffer, 0, hi_group, beg_line, 0, end_col)
		elseif (beg_line - 1 == end_line) then
			api.nvim_buf_add_highlight(current_buffer, 0, hi_group, beg_line - 1, 0, end_col)
		else

			local counter = 0

			for i=beg_line - 1, end_line - 1, 1 do
				if (i ~= end_line - 1) then
					if (counter > 0) then
						api.nvim_buf_clear_namespace(current_buffer, 0, i, i + 1)
						api.nvim_buf_add_highlight(current_buffer, 0, hi_group, i, 0, get_cols(i + 1) - 1)
					else
						counter = counter + 1
						api.nvim_buf_add_highlight(current_buffer, 0, hi_group, beg_line - 1, beg_col, end_col)
					end
				else
					api.nvim_buf_add_highlight(current_buffer, 0, hi_group, i, 0, end_col)
				end
			end
		end
	end

	cmd([[let g:dm_cursor_pos_after = getpos(".")]])
	local after_pos_two = api.nvim_eval([[get(s:,"g:dm_cursor_pos_after[2]", 0)]])
	api.nvim_buf_add_highlight(current_buffer, 0, hi_group, beg_line - 1, after_pos_two - 1, after_pos_two)

	cmd("unlet g:dm_cursor_pos_after")



	-- cmd("echo 'after = "..after_pos_two.."'")
	-- api.nvim_exec([[
	-- 	let save_pos = getpos(".")
	-- 	call nvim_buf_add_highlight(bufnr('%'), 0, 'LineHighlight', beg_minus_one, save_pos[2] - 1, save_pos[2])
	-- ]], false)

end

return M



