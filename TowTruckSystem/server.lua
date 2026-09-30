local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('towtruck:checkAccess', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = xPlayer.identifier

    MySQL.Async.fetchScalar('SELECT has_access FROM towtruck_system WHERE player_id = @playerId AND job_name = @jobName', {
        ['@playerId'] = playerId,
        ['@jobName'] = Config.BossMenu.jobName
    }, function(hasAccess)
        cb(hasAccess)
    end)
end)

RegisterNetEvent('towtruck:updateAccess')
AddEventHandler('towtruck:updateAccess', function(playerId, hasAccess)
    MySQL.Async.execute('INSERT INTO towtruck_system (player_id, job_name, has_access) VALUES (@playerId, @jobName, @hasAccess) ON DUPLICATE KEY UPDATE has_access = @hasAccess', {
        ['@playerId'] = playerId,
        ['@jobName'] = Config.BossMenu.jobName,
        ['@hasAccess'] = hasAccess
    })
end)