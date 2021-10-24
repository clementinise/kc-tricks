local isInAnim = false

local dict = 'rcmextreme2atv'

RegisterKeyMapping('stunt1', 'Stunt 1', 'MOUSE_BUTTON', 'MOUSE_LEFT')
RegisterKeyMapping('stunt2', 'Stunt 2', 'MOUSE_BUTTON', 'MOUSE_RIGHT')
RegisterKeyMapping('stunt3', 'Stunt 3', 'MOUSE_BUTTON', 'MOUSE_EXTRABTN1')
RegisterKeyMapping('stunt4', 'Stunt 4', 'MOUSE_BUTTON', 'MOUSE_EXTRABTN2')

function Stunt1()
	isInAnim = true
	Anim = 'idle_b'
	Player = PlayerPedId()
	Veh = GetVehiclePedIsIn(Player, false)
	Model = GetEntityModel(Veh)

	while not HasAnimDictLoaded(dict) do 
		Wait(0)
		RequestAnimDict(dict)
	end

	if IsEntityInAir(Veh) and IsThisModelABike(Model) then
		while IsControlPressed(0, 76) do
			if not IsEntityPlayingAnim(Player, dict, Anim, 3) then
				TaskPlayAnimAdvanced(Player, dict, Anim, 0, 0, 0, 0, 0, 0, 8.0, 8.0, -1, 0, 0.28, false, false)
			elseif not IsEntityInAir(Veh) then
				if Config.Eject then
					Eject()
				else
					ClearPedTasks(Player)
				end
				return
			end
			Citizen.Wait(100)
		end
	end
end

RegisterCommand('stunt1', function()
	
	Stunt1()
	if isInAnim then
		InAnim = false
		ClearPedTasks(PlayerPedId())
	end

end)

function Stunt2()
	isInAnim = true
	Anim = 'idle_c'
	Player = PlayerPedId()
	Veh = GetVehiclePedIsIn(Player, false)
	Model = GetEntityModel(Veh)

	while not HasAnimDictLoaded(dict) do 
		Wait(0)
		RequestAnimDict(dict)
	end

	if IsEntityInAir(Veh) and IsThisModelABike(Model) then
		while IsControlPressed(0, 76) do
			if not IsEntityPlayingAnim(Player, dict, Anim, 3) then
				TaskPlayAnimAdvanced(Player, dict, Anim, 0, 0, 0, 0, 0, 0, 8.0, 8.0, -1, 0, 0.16, false, false)
			elseif not IsEntityInAir(Veh) then
				if Config.Eject then
					Eject()
				else
					ClearPedTasks(Player)
				end
				return
			end
			Citizen.Wait(100)
		end
	end
end

RegisterCommand('stunt2', function()

	Stunt2()
	if isInAnim then
		InAnim = false
		ClearPedTasks(PlayerPedId())
	end

end)

function Stunt3()
	isInAnim = true
	Anim = 'idle_d'
	Player = PlayerPedId()
	Veh = GetVehiclePedIsIn(Player, false)
	Model = GetEntityModel(Veh)

	while not HasAnimDictLoaded(dict) do 
		Wait(0)
		RequestAnimDict(dict)
	end

	if IsEntityInAir(Veh) and IsThisModelABike(Model) then
		while IsControlPressed(0, 76) do
			if not IsEntityPlayingAnim(Player, dict, Anim, 3) then
				TaskPlayAnimAdvanced(Player, dict, Anim, 0, 0, 0, 0, 0, 0, 8.0, 8.0, -1, 0, 0.18, false, false)
			elseif not IsEntityInAir(Veh) then
				if Config.Eject then
					Eject()
				else
					ClearPedTasks(Player)
				end
				return
			end
			Citizen.Wait(100)
		end
	end
end

RegisterCommand('stunt3', function()

	Stunt3()
	if isInAnim then
		InAnim = false
		ClearPedTasks(PlayerPedId())
	end

end)

function Stunt4()
	isInAnim = true
	Anim = 'idle_e'
	Player = PlayerPedId()
	Veh = GetVehiclePedIsIn(Player, false)
	Model = GetEntityModel(Veh)

	while not HasAnimDictLoaded(dict) do 
		Wait(0)
		RequestAnimDict(dict)
	end

	if IsEntityInAir(Veh) and IsThisModelABike(Model) then
		while IsControlPressed(0, 76) do
			if not IsEntityPlayingAnim(Player, dict, Anim, 3) then
				TaskPlayAnimAdvanced(Player, dict, Anim, 0, 0, 0, 0, 0, 0, 8.0, 8.0, -1, 0, 0.15, false, false)
			elseif not IsEntityInAir(Veh) then
				if Config.Eject then
					Eject()
				else
					ClearPedTasks(Player)
				end
				return
			end
			Citizen.Wait(100)
		end
	end
end

RegisterCommand('stunt4', function()

	Stunt4()
	if isInAnim then
		InAnim = false
		ClearPedTasks(PlayerPedId())
	end

end)

function Eject()
	Vehv = GetEntityVelocity(GetVehiclePedIsIn(PlayerPedId(), false))
    SetPedToRagdoll(Player, 2800, 2800, 0, 0, 0, 0)
    SetEntityVelocity(Player, Vehv.x * 1.5, Vehv.y * 1.5, Vehv.z * 1.5)
end