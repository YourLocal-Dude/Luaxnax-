-- LuaxnaxLoader.lua
-- Roblox Loadstring-Compatible .lxn Script Executor

local function isLxn(url)
    return url:match("%.lxn$")
end

local function fetch(url)
    local success, response = pcall(game.HttpGet, game, url)
    if success then
        return response
    else
        warn("Failed to fetch .lxn script:", response)
        return nil
    end
end

local function parseLxn(code)
    local output = ""
    for line in code:gmatch("[^\r\n]+") do
        local cmd, rest = line:match("^(%w+)%s+(.+)$")
        if cmd == "Say" then
            output = output .. 'print(' .. rest .. ')\n'
        elseif cmd == "Set" then
            local var, val = rest:match("^(%w+)%s*=%s*(.+)$")
            output = output .. '_G["' .. var .. '"] = ' .. val .. '\n'
        elseif cmd == "Add" then
            local var, val = rest:match("^(%w+)%s*%+%s*(.+)$")
            output = output .. '_G["' .. var .. '"] = (_G["' .. var .. '"] or 0) + ' .. val .. '\n'
        elseif cmd == "Wait" then
            output = output .. 'wait(' .. rest .. ')\n'
        elseif cmd == "Loop" then
            local count, loopLine = rest:match("^(%d+)%s+(.+)$")
            if count and loopLine then
                for _ = 1, tonumber(count) do
                    output = output .. parseLxn(loopLine)
                end
            end
        elseif cmd == "Teleport" then
            local name, x, y, z = rest:match("(%w+)%s+(%-?%d+%.?%d*)%s+(%-?%d+%.?%d*)%s+(%-?%d+%.?%d*)")
            output = output .. 'local p = game.Players[' .. string.format("%q", name) .. ']; if p then p.Character:SetPrimaryPartCFrame(CFrame.new(' .. x .. ',' .. y .. ',' .. z .. ')) end\n'
        end
    end
    return output
end

return function(url)
    if not isLxn(url) then
        warn("Luaxnax: File must end in .lxn")
        return
    end

    local code = fetch(url)
    if code then
        local luaCode = parseLxn(code)
        loadstring(luaCode)()
    end
end
