local env = getgenv()

local aliases = {
    ["getscriptclosure"] = {"getscriptfunction"},
    ["hookfunction"] = {"replaceclosure"},
    ["isexecutorclosure"] = {"checkclosure", "isourclosure"},
    ["rconsoleclear"] = {"consoleclear"},
    ["rconsolecreate"] = {"consolecreate"},
    ["rconsoledestroy"] = {"consoledestroy"},
    ["rconsoleinput"] = {"consoleinput"},
    ["rconsoleprint"] = {"consoleprint"},
    ["rconsolesettitle"] = {"rconsolename", "consolesettitle"},
    ["crypt.base64encode"] = {
        "crypt.base64.encode",
        "crypt.base64_encode",
        "base64.encode",
        "base64_encode"
    },
    ["crypt.base64decode"] = {
        "crypt.base64.decode",
        "crypt.base64_decode",
        "base64.decode",
        "base64_decode"
    },
    ["isrbxactive"] = {"isgameactive"},
    ["identifyexecutor"] = {"getexecutorname"},
    ["queue_on_teleport"] = {"queueonteleport"},
    ["request"] = {"http.request", "http_request"},
    ["setclipboard"] = {"toclipboard"},
    ["getthreadidentity"] = {
        "getidentity",
        "getthreadcontext"
    },
    ["setthreadidentity"] = {
        "setidentity",
        "setthreadcontext"
    },
    ["getscriptbytecode"] = {"dumpstring"},
}

local function setGlobal(path, value)
    local current = env

    local parts = {}
    for part in string.gmatch(path, "[^.]+") do
        table.insert(parts, part)
    end

    for i = 1, #parts - 1 do
        local part = parts[i]

        if type(current[part]) ~= "table" then
            current[part] = {}
        end

        current = current[part]
    end

    current[parts[#parts]] = value
end

for functionName, functionAliases in pairs(aliases) do
    local func = getGlobal and getGlobal(functionName) or nil

    if not func then
        local current = env

        for part in string.gmatch(functionName, "[^.]+") do
            current = current and current[part]
        end

        func = current
    end

    if type(func) == "function" then
        for _, alias in ipairs(functionAliases) do
            if getGlobal and getGlobal(alias) == nil then
                setGlobal(alias, func)
            end
        end
    end
end
