

local M = {}


-- DMBookmark [toggle/create/delete/annotate/save/next/prev]	- default = toggle

local arguments = {
	["toggle"] = "toggle",
	["create"] = "create",
	["delete"] = "delete",
	["annotate"] = "annotate",
	["save"] = "save",
	["next"] = "next",
	["prev"] = "prev",
}

function M.available_commands()
	return vim.tbl_keys(arguments)
end


return M

