local ESX = nil
local isTowing = false
local towRope = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        if DoesEntityExist(vehicle) and GetEntityModel(vehicle) == GetHashKey(Config.TowTruckModel) then
            if IsControlJustPressed(0, 38) then -- E key
                if not isTowing then
                    StartTowing(vehicle)
                else
                    StopTowing()
                end
            end
        end
    end
end)

function StartTowing(towTruck)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local forward = GetEntityForwardVector(playerPed)
    local spawnCoords = vector3(coords.x + forward.x * 5.0, coords.y + forward.y * 5.0, coords.z)

    towRope = CreateObject(GetHashKey(Config.TowRopeModel), spawnCoords.x, spawnCoords.y, spawnCoords.z, true, false, false)
    AttachEntityToEntity(towRope, towTruck, GetEntityBoneIndexByName(towTruck, 'chassis'), 0.0, -1.0, -0.5, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
    isTowing = true
end

function StopTowing()
    if towRope ~= nil then
        DeleteEntity(towRope)
        towRope = nil
    end
    isTowing = false
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.TriggerServerCallback('towtruck:checkAccess', function(hasAccess)
        if hasAccess then
            -- Enable boss menu and clothing menu
        end
    end)
end)