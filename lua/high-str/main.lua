local M = {}

local cmd = vim.cmd
local tool_verbosity = require("high-str.tools.tool-verbosity.init")

function M.main(option, command_option)
    option = option or 0
    command_option = command_option or "NONE"

    if (option == "highlight") then
        tool_verbosity.verbose_print("Highlighting...")
        require("high-str.tools.tool-highlight.highlight.init").main(command_option)
    elseif (option == "rmhighlight") then
        tool_verbosity.verbose_print("Removing Highlight...")
        require("high-str.tools.tool-highlight.rmhighlight.init").main(command_option)
    elseif (option == "export") then
        tool_verbosity.verbose_print("Exporting Highlights...")
        -- require("high-str.tools.tool-highlight.rmhighlight.init").main(command_option)
    elseif (option == "import") then
        tool_verbosity.verbose_print("Importing Highlights...")
        -- require("high-str.tools.tool-highlight.rmhighlight.init").main(command_option)
    else
		print("HighStr: command was not recognized")
    end
end

return M
