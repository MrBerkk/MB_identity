--[[################################################################################################
####################################################################################################
####### MrBerk#2389             BU                                                MrBerk#001 #######
#######                           SCRIPT                                                     #######
####### https://mrberk.com             MRBERK                       https://mrberk.com/forum #######
#######                                     TARAFINDAN                                       #######
####### //2021-MrBerk-Dev//                           DUZENLENMISTIR     //2021-MrBerk-Dev// #######
####################################################################################################
#################################################################################################### 
--]]
ESX = nil
local loadingScreenFinished = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_identity:alreadyRegistered')
AddEventHandler('esx_identity:alreadyRegistered', function()
	while not loadingScreenFinished do
		Citizen.Wait(100)
	end

	TriggerEvent('esx_skin:playerRegistered')
end)

AddEventHandler('esx:loadingScreenOff', function()
	loadingScreenFinished = true
end)

if not Config.UseDeferrals then
	local guiEnabled, isDead = false, false

	AddEventHandler('esx:onPlayerDeath', function(data)
		isDead = true
	end)

	AddEventHandler('esx:onPlayerSpawn', function(spawn)
		isDead = false
	end)

	function EnableGui(state)
		SetNuiFocus(state, state)
		guiEnabled = state

		SendNUIMessage({
			type = "enableui",
			enable = state
		})
	end

	RegisterNetEvent('esx_identity:showRegisterIdentity')
	AddEventHandler('esx_identity:showRegisterIdentity', function()
		TriggerEvent('esx_skin:resetFirstSpawn')
	--	TriggerEvent('introCinematic:start')	-- Anımasyonu İlk Girişte Başlatmak Için Yorumu Kaldır (alt tarafta ki --# işaretli kodu yorum satırına almayı unutma)
	--	Citizen.Wait(90000)
		if not isDead then
			TriggerEvent('cui_character:open', { 'identity', 'features', 'style', 'apparel' }, false)
		end
	end)

	RegisterNUICallback('register', function(data, cb)
		ESX.TriggerServerCallback('cui_character:updateIdentity', function(callback)
			if callback then
				ESX.ShowNotification(_U('thank_you_for_registering'))
				TriggerEvent('cui_character:setCurrentIdentity', data)
				TriggerEvent('cui_character:close', true)
				TriggerEvent('introCinematic:start')		--# Kayıt Sonrası Anımasyon Baslatma Kodu
			else
				ESX.ShowNotification(_U('registration_error'))
			end
		end, data)
	end)

	Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)

            if guiEnabled then
                DisableControlAction(0, 1,   true) -- LookLeftRight
                DisableControlAction(0, 2,   true) -- LookUpDown
                DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
                DisableControlAction(0, 142, true) -- MeleeAttackAlternate
                DisableControlAction(0, 30,  true) -- MoveLeftRight
                DisableControlAction(0, 31,  true) -- MoveUpDown
                DisableControlAction(0, 21,  true) -- disable sprint
                DisableControlAction(0, 24,  true) -- disable attack
                DisableControlAction(0, 25,  true) -- disable aim
                DisableControlAction(0, 47,  true) -- disable weapon
                DisableControlAction(0, 58,  true) -- disable weapon
                DisableControlAction(0, 263, true) -- disable melee
                DisableControlAction(0, 264, true) -- disable melee
                DisableControlAction(0, 257, true) -- disable melee
                DisableControlAction(0, 140, true) -- disable melee
                DisableControlAction(0, 141, true) -- disable melee
                DisableControlAction(0, 143, true) -- disable melee
                DisableControlAction(0, 75,  true) -- disable exit vehicle
                DisableControlAction(27, 75, true) -- disable exit vehicle
                DisableControlAction(0, 245, true)
                DisableControlAction(0, 309, true)
            
            end
        end
    end)
end