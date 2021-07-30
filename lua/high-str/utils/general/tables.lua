local M = {}

function M.table_length(tbl)
    local count = 0
    for _, _ in pairs(tbl) do
        count = count + 1
    end
    return count
end

function M.has_element(table, element, type)
    type = type or "index"

    if (type == "value") then
        for index, value in pairs(table) do
            if value == element then
                return true
            end
        end
    elseif (type == "index") then
        for index, value in pairs(table) do
            if index == element then
                return true
            end
        end
    end
    return false
end

function M.remove_element(tbl, element)
    element = element or "NONE"

    for key, value in pairs(tbl) do
        if (value == element) then
            tbl[key] = nil
        end
    end
end

return M
