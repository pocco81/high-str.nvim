

local M = {}

function M.load_viml_funcs()
	vim.api.nvim_exec([[
		function! DMGetColor(group, attr)
			return synIDattr(synIDtrans(hlID(a:group)), a:attr)
		endfunction
		com! -nargs=+ -complete=command GetColor call GetColor(<q-args>)
	]], false)
end

return M
