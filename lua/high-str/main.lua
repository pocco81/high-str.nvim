local M = {}

local cmd = vim.cmd
local tool_verbosity = require("high-str.tools.tool-verbosity.init")

function M.main(option, command_option)
    option = option or 0
    command_option = command_option or "NONE"

    if (option == 0) then
        tool_verbosity.verbose_print("Highlighting...")
        require("high-str.tools.tool-highlight.highlight.init").main(command_option)
    elseif (option == 1) then
        tool_verbosity.verbose_print("Removing Highlight...")
        require("high-str.tools.tool-highlight.rmhighlight.init").main(command_option)
    else
        cmd("echo 'Command was not recognized for HighStr.nvim'")
    end
end

return M
