alreadyhelped = false

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(0)
	end
	while true do
	Wait(0)
	local pc = GetEntityCoords(PlayerPedId())
    local tc = vector3(312.2092, -592.8922, 43.2840)
                        if #(pc - tc) < 1.0 then
                        t(tc, '[E] To get help')
                        if IsControlJustPressed(0, 38) then
		                if not IsEntityDead(PlayerPedId()) then
                        SetEntityCoords(PlayerPedId(), 314.4297, -584.4702, 44.2040)
		                SetEntityHeading(PlayerPedId(), 339.1871)
		                ExecuteCommand("e passout4")
		                exports['asd']:run(120,'You are getting help...','#E14127')
                        Wait(120000)
			            SetEntityHealth(PlayerPedId(), 200)
			            SetEntityCoords(PlayerPedId(), 315.7460, -584.4713, 43.2840)
			            ClearPedTasksImmediately(PlayerPedId())
			            ESX.ShowNotification('You got helped!')
				        ExecuteCommand("walk drunk3")
				        ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 1.0)
				        ESX.ShowNotification('You are feeling littlebit dizzy, you just wokeup from the bed...')
				        Wait(20000)
				        ResetPedMovementClipset(PlayerPedId())
				        ESX.ShowNotification('You are feeling better now!')
				        StopGameplayCamShaking()
				end
			end
        end
    end
end)

CreateThread(function()
	npcHash = GetHashKey("s_m_m_paramedic_01")
	RequestModel(npcHash)
	while not HasModelLoaded(npcHash) do
		Wait(0)
	end
	npc = CreatePed(1, npcHash, 311.8335, -594.1014, 42.2840, 342.3660, false, true)
	SetBlockingOfNonTemporaryEvents(npc, true)
	SetPedDiesWhenInjured(npc, false)
	SetPedCanPlayAmbientAnims(npc, true)
	SetPedCanRagdollFromPlayerImpact(npc, false)
	SetEntityInvincible(npc, true)
	FreezeEntityPosition(npc, true)
end)

function t(coordinates, text)
    local onScreen, x, y = World3dToScreen2d(coordinates.x, coordinates.y, coordinates.z+0.20)
    SetTextScale(0.41, 0.41)
    SetTextOutline()
    SetTextDropShadow()
    SetTextDropshadow(2, 0, 0, 0, 255)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 255)
    AddTextComponentString(text)
    DrawText(x, y)
    local factor = (string.len(text)) / 400
    DrawRect(x, y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end
