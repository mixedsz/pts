GlobalState.peacetime = false

RegisterCommand('pt', function(source, args, rawCommand)
    local allowed = source == 0 or IsPlayerAceAllowed(tostring(source), 'simple_pt.toggle')

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
end, true)
