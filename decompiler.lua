getgenv().decompile = function(script_instance)
    local bytecode = getscriptbytecode(script_instance)
    if not bytecode or bytecode == "" then
        return "-- ERR: failed to get bytecode"
    end

    local encoded = crypt.base64encode(bytecode)

    local ok, res = pcall(request, {
        Url    = "http://localhost:3000/luau/decompile",
        Method = "POST",
        Body   = encoded,
    })

    if not ok then
        return "-- ERR: server not reachable"
    end

    if res.StatusCode ~= 200 then
        return "-- ERR: decompile failed (HTTP " .. tostring(res.StatusCode) .. ")\n" .. (res.Body or "")
    end

    return res.Body
end
