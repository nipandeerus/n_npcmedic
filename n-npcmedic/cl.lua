ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

alreadyhelped = false

local npc = vector4(312.20, -592.89, 43.28, 20)
local spawn = vector4(315.74, -584.47, 43.28, 20)
local bed = vector4(314.42, -584.47, 44.20, 339.18)

CreateThread(function()
	while true do
        if not alreadyhelped then
            local pc = GetEntityCoords(PlayerPedId())
            local tc = vector3(npc.x, npc.y, npc.z)
            if #(pc - tc) < 1.0 then
                t(vector3(npc.x, npc.y, npc.z + 0.20), '[E] To get help')
                if IsControlJustPressed(0, 38) then
                    if not IsEntityDead(PlayerPedId()) then
                        SetEntityCoords(PlayerPedId(), bed.x, bed.y, bed.z)
                        SetEntityHeading(PlayerPedId(), bed.w)
                        ExecuteCommand("e passout4")
                        exports['asd']:run(120,'You are getting help...','#E14127')
                        Wait(120000)
                        SetEntityHealth(PlayerPedId(), 200)
                        SetEntityCoords(PlayerPedId(), spawn.x, spawn.y, spawn.z)
                        SetEntityHeading(PlayerPedId(), spawn.w)
                        ClearPedTasksImmediately(PlayerPedId())
                        ESX.ShowNotification('You got helped!')
                        ExecuteCommand("walk drunk3")
                        ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 1.0)
                        ESX.ShowNotification('You are feeling littlebit dizzy, you just wokeup from the bed...')
                        Wait(20000)
                        ResetPedMovementClipset(PlayerPedId())
                        ESX.ShowNotification('You are feeling better now!')
                        alreadyhelped = true
                        StopGameplayCamShaking()
					end
				end
            else
                Wait(100 * #(pc - tc))
			end
        end
        Wait(0)
    end
end)

CreateThread(function()
	npcHash = GetHashKey("s_m_m_paramedic_01")
	RequestModel(npcHash)
    repeat Wait(10) until HasModelLoaded(npcHash)
	npc = CreatePed(1, npcHash, npc.x, npc.y, npc.z, npc.w, false, true)
	SetBlockingOfNonTemporaryEvents(npc, true)
	SetPedDiesWhenInjured(npc, false)
	SetPedCanPlayAmbientAnims(npc, true)
	SetPedCanRagdollFromPlayerImpact(npc, false)
	SetEntityInvincible(npc, true)
	FreezeEntityPosition(npc, true)
end)

function t(c, t)
    local onScreen, x, y = World3dToScreen2d(c.x, c.y, c.z)
    SetTextScale(0.41, 0.41)
    SetTextOutline()
    SetTextDropShadow()
    SetTextDropshadow(2, 0, 0, 0, 255)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 255)
    AddTextComponentString(t)
    DrawText(x, y)
    local factor = (string.len(t)) / 400
    DrawRect(x, y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end
