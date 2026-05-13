GlobalState.peacetime = false

local ESX = exports['es_extended']:getSharedObject()
local adminGroups = { 'admin', 'owner' }

local function isAllowed(source)
    if source == 0 then return true end
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local group = xPlayer.getGroup()
        for _, g in ipairs(adminGroups) do
            if group == g then return true end
        end
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
