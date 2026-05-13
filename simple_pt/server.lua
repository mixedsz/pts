GlobalState.peacetime = false

local adminGroups = { 'group.owner', 'group.admin' }

local function isAllowed(source)
    if source == 0 then return true end
    for _, group in ipairs(adminGroups) do
        if IsPlayerAceAllowed(tostring(source), group) then return true end
    end
    return IsPlayerAceAllowed(tostring(source), 'simple_pt.toggle')
end

RegisterCommand('pt', function(source, args, rawCommand)
    local allowed = isAllowed(source)

    if not allowed then
        TriggerClientEvent('chat:addMessage', source, {
            color = { 255, 0, 0 },
            multiline = true,
            args = { "You do not have permission to toggle peacetime." }
        })
        return
    end

    if GlobalState.peacetime == false then
        GlobalState.peacetime = true
        TriggerClientEvent('pt:enabled', -1)
    else
        GlobalState.peacetime = false
        TriggerClientEvent('pt:disabled', -1)
    end
end, false)
