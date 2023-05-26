local animDict = 'rcmextreme2atv'
local inTricks = false
local animParams = {
    ['stunt1'] = {'idle_b', 0.28, 0.5, 0.54, 0.50},
    ['stunt2'] = {'idle_c', 0.15, 0.44, 0.52, 0.46},
    ['stunt3'] = {'idle_d', 0.18, 0.69, 0.71, 0.20},
    ['stunt4'] = {'idle_e', 0.15, 0.35, 0.37, 0.35},
}

local buttons = {
    ['stunt1'] = 'MOUSE_LEFT',
    ['stunt2'] = 'MOUSE_RIGHT',
    ['stunt3'] = 'MOUSE_EXTRABTN1',
    ['stunt4'] = 'MOUSE_EXTRABTN2',
}

for stunt, button in pairs(buttons) do
    RegisterKeyMapping(stunt, 'Stunt '..stunt:sub(6), 'MOUSE_BUTTON', button)
end

function PerformStunt(stunt)
    local Player = PlayerPedId()
    local Veh = GetVehiclePedIsIn(Player, false)
    local Model = GetEntityModel(Veh)
    local vehicleName = GetDisplayNameFromVehicleModel(Model)

    if not SpecificVehicle(Config.Vehicles, vehicleName) then return end

    local animName, Start, Mid1, Mid2, Loop = table.unpack(animParams[stunt])

    if not HasAnimDictLoaded(animDict) then
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do Wait(50) end
    end

    if IsEntityInAir(Veh) then

        inTricks = false
        Wait(50)
        inTricks = true

        while IsControlPressed(0, Config.SimpleKey) and inTricks do
            if not IsEntityPlayingAnim(Player, animDict, animName, 3) then
                TaskPlayAnimAdvanced(Player, animDict, animName, 0, 0, 0, 0, 0, 0, 8.0, 8.0, -1, 0, Start, false, false)
            elseif GetEntityAnimCurrentTime(Player, animDict, animName) >= Mid1 and GetEntityAnimCurrentTime(Player, animDict, animName) < Mid2 and IsEntityInAir(Veh) then
                TaskPlayAnimAdvanced(Player, animDict, animName, 0, 0, 0, 0, 0, 0, 8.0, 8.0, -1, 0, Loop, false, false)
            elseif not IsEntityInAir(Veh) then
                if Config.Eject then
                    Eject(Player, Veh)
                else
                    if Config.InstantAnimStop then ClearPedTasks(Player) else StopAnimTask(Player, animDict, animName, 1.0) end
                end
                return
            end
            Wait(50)
        end
		if Config.InstantAnimStop then ClearPedTasks(Player) else StopAnimTask(Player, animDict, animName, 1.0) end
    end
end

for stunt, _ in pairs(animParams) do
    RegisterCommand(stunt, function() PerformStunt(stunt) end)
end

function Eject(Player, Veh)
    local VehV = GetEntityVelocity(Veh)
    SetEntityCoords(Player, GetEntityCoords(Veh, 0.0, 0.0, -0.7))
    SetPedToRagdoll(Player, 2800, 2800, 0, 0, 0, 0)
    SetEntityVelocity(Player, VehV.x * 1.5, VehV.y * 1.5, VehV.z)
end

function SpecificVehicle(table, val)
    if Config.SpecificVehicle then
        for i=1,#table do
            if table[i] == val then
                return true
            end
        end
        return false
    end
    return true
end

exports("IsDoingTricks", function()
    return inTricks
end)
