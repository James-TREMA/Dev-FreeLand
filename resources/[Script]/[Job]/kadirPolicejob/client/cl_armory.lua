ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    isPlayerWhitelisted = refreshPlayerWhitelisted()
    PlayerData = ESX.GetPlayerData()
end)


-- Le job se refresh pour plus avoir le f6 etc

RegisterNetEvent("esx:setJob")
AddEventHandler(
    "esx:setJob",
    function(job)
        PlayerData.job = job

        isPlayerWhitelisted = refreshPlayerWhitelisted()
    end
)

function refreshPlayerWhitelisted()
    if not ESX.PlayerData then
        return false
    end

    if not ESX.PlayerData.job then
        return false
    end

    for k, v in ipairs(Config.WhitelistedCops) do
        if v == ESX.PlayerData.job.name then
            return true
        end
    end

    return false
end

-- Fin refresh

RegisterNetEvent('esx_policejob:onDuty')
AddEventHandler('esx_policejob:onDuty', function()
	onDuty = true
end)

RegisterNetEvent('esx_policejob:offDuty')
AddEventHandler('esx_policejob:offDuty', function()
	onDuty = false
end)

-- Local checkbox

local tazer = false
local pistol = false
local fusil = false
local m4 = false
local smg = false
local gaz = false
local matraque = false

-- Menu

RMenu.Add('armurerie', 'main', RageUI.CreateMenu("Armurerie", "Voici la liste des ~o~armes~s~ !"))
    
    Citizen.CreateThread(function()
            local pPed = GetPlayerPed(-1)
        while true do
        RageUI.IsVisible(RMenu:Get('armurerie', 'main'),  function()
						
			RageUI.Checkbox("Tazer (~o~Volts x26~s~)",nil, tazer,{},function(Hovered,Ative,Selected,Checked)
				if Selected then
					tazer = Checked
					weapon = 'WEAPON_STUNGUN'

					if Checked then
						TriggerServerEvent('esx_policejob:AddTazer') 
					else
						RemoveWeaponFromPed(pPed, weapon)
						ESX.ShowNotification('-1 ~o~Tazer')
					end
				end
			end)

			if ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant' or ESX.PlayerData.job.grade_name == 'boss' then
				RageUI.Checkbox("Pistolet",nil, pistol,{},function(Hovered,Ative,Selected,Checked)
					if Selected then
						pistol = Checked
						weapon = 'WEAPON_PISTOL'

						if Checked then
							TriggerServerEvent('esx_policejob:AddPistol') 
						else
							RemoveWeaponFromPed(pPed, weapon)
							ESX.ShowNotification('-1 ~o~Pistolet')
						end
					end
				end)
			end

			if ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant' or ESX.PlayerData.job.grade_name == 'boss' then
				RageUI.Checkbox("Fusil à pompe",nil, fusil,{},function(Hovered,Ative,Selected,Checked)
					if Selected then
						fusil = Checked
						weapon = 'WEAPON_PUMPSHOTGUN'

						if Checked then
							TriggerServerEvent('esx_policejob:AddPump') 
						else
							RemoveWeaponFromPed(pPed, weapon)
							ESX.ShowNotification('-1 ~o~Fusil à pompe')
						end
					end
				end)
			end

			if ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant' or ESX.PlayerData.job.grade_name == 'boss' then
				RageUI.Checkbox("Carabine d'assault",nil, m4,{},function(Hovered,Ative,Selected,Checked)
					if Selected then
						m4 = Checked
						weapon = 'WEAPON_CARBINERIFLE'

						if Checked then
							TriggerServerEvent('esx_policejob:AddCarabine') 
						else
							RemoveWeaponFromPed(pPed, weapon)
							ESX.ShowNotification('-1 ~o~Carabine d\'assault')
						end
					end
				end)
			end

			if ESX.PlayerData.job.grade_name == 'lieutenant' or ESX.PlayerData.job.grade_name == 'boss' then
				RageUI.Checkbox("Smg",nil, smg,{},function(Hovered,Ative,Selected,Checked)
					if Selected then
						smg = Checked
						weapon = 'WEAPON_SMG'

						if Checked then
							TriggerServerEvent('esx_policejob:AddSmg') 
						else
							RemoveWeaponFromPed(pPed, weapon)
							ESX.ShowNotification('-1 ~o~SMG')
						end
					end
				end)
			end

			RageUI.Checkbox("Matraque",nil, matraque,{},function(Hovered,Ative,Selected,Checked)
				if Selected then
					matraque = Checked
					weapon = 'WEAPON_NIGHTSTICK'

					if Checked then
						TriggerServerEvent('esx_policejob:AddMatraque') 
					else
						RemoveWeaponFromPed(pPed, weapon)
						ESX.ShowNotification('-1 ~o~Matraque')
					end
				end
			end)

			if ESX.PlayerData.job.grade_name == 'lieutenant' or ESX.PlayerData.job.grade_name == 'boss' then
				RageUI.Checkbox("Gaz",nil, gaz,{},function(Hovered,Ative,Selected,Checked)
					if Selected then
						gaz = Checked
						weapon = 'WEAPON_BZGAS'

						if Checked then
							TriggerServerEvent('esx_policejob:AddGaz') 
						else
							RemoveWeaponFromPed(pPed, weapon)
							ESX.ShowNotification('-15 ~o~Gaz')
						end
					end
				end)
			end
		
        	end, function()
        	end, 1)
        	Citizen.Wait(0)
    	end
    end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, 452.45, -980.14, 30.69)
		if ESX.PlayerData.job.name == 'police' then
			if dist <= 1.2 then
				ESX.DrawMissionText("Appuyez sur [~b~E~s~] pour acceder à l'~b~armurerie~s~ !")
				if IsControlJustPressed(1,51) then 
					if onDuty then
						RageUI.Visible(RMenu:Get('armurerie', 'main'), not RageUI.Visible(RMenu:Get('armurerie', 'main')))
					else 
						ESX.ShowNotification('~g~Information~s~ :\nTu dois êtres en ~b~service~s~ pour acceder à ~o~l\'armurerie~s~ !')
					end
				end
			end
		end
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("s_m_y_armymech_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "s_m_y_armymech_01", 454.18048095703, -980.11981201172, 29.689603805542, 90.0, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
end)

