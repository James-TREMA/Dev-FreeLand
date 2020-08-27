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

-- Funtion spanw car

spawnCar = function(car)

    FreezeEntityPosition(GetPlayerPed(-1), true)
    local car = GetHashKey(car)



    RequestModel(car)

    while not HasModelLoaded(car) do

        RequestModel(car)

        Citizen.Wait(1)

    end


    local vehicle = CreateVehicle(car, 447.311, -1006.701, 27.44, 174.38, false, false)
    
    ESX.ShowAdvancedNotification("LSPD", "~b~Achat Effectué", "Le vÉhicule se trouve juste derriere vous", "CHAR_CALL911", 1)
    SetEntityAsNoLongerNeeded(vehicle)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleNumberPlateText(vehicle, "POLICE")
    FreezeEntityPosition(GetPlayerPed(-1), false)
end

-- Menu

RMenu.Add('garage', 'main', RageUI.CreateMenu("Garage", "Voici la liste des ~o~vÉhicules~s~ !"))
    
    Citizen.CreateThread(function()
            local pPed = GetPlayerPed(-1)
        while true do
        RageUI.IsVisible(RMenu:Get('garage', 'main'),  function()
            
            
            RageUI.Button("Police - ~o~Patrouille Cadet", nil, {RightLabel = "~g~Prendre ~o~ →"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    spawnCar("police")
                end
            end)    
        
            RageUI.Button("Police - ~o~Charger", nil, {RightLabel = "~g~Prendre ~o~ →"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    spawnCar("18charger")
                end
            end)

            RageUI.Button("Police - ~o~Patrouille nocturne", nil, {RightLabel = "~g~Prendre ~o~ →"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    spawnCar("14charger")
                end
            end)

        if ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant' or ESX.PlayerData.job.grade_name == 'boss' then 
            RageUI.Button("Police - ~o~Moto", nil, {RightLabel = "~g~Prendre ~o~ →"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    spawnCar("policeb")
                end
            end)
        end   

        if ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant' or ESX.PlayerData.job.grade_name == 'boss' then
            RageUI.Button("Police - ~o~Ford SUV", nil, {RightLabel = "~g~Prendre ~o~ →"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    spawnCar("16explorer")
                end
            end)
        end

        if ESX.PlayerData.job.grade_name == 'lieutenant' or ESX.PlayerData.job.grade_name == 'boss' then 
            RageUI.Button("Police - ~o~4x4 tout terrain", nil, {RightLabel = "~g~Prendre ~o~ →"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    spawnCar("03expeditionr")
                end
            end)
        end

        if ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant' or ESX.PlayerData.job.grade_name == 'boss' then 
            RageUI.Button("Police - ~r~V.I.R", nil, {RightLabel = "~g~Prendre ~o~ →"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    spawnCar("ghispo2")
                end
            end)
        end

        	end, function()
        	end, 1)
        	Citizen.Wait(0)
    	end
    end)

local lspd = vector3(457.535, -1008.364, 28.298)
local ped = vector4(458.654, -1008.088, 27.271, 91.220)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, lspd)
        if PlayerData.job and PlayerData.job.name == 'police' then
		--if ESX.PlayerData.job.name == 'police' then
			if dist <= 1.2 then
				ESX.DrawMissionText("Appuyez sur [~b~E~s~] pour acceder au ~b~garage~s~ !")
				if IsControlJustPressed(1,51) then 
					if onDuty then
					    RageUI.Visible(RMenu:Get('garage', 'main'), not RageUI.Visible(RMenu:Get('armurerigaragee', 'main')))
                    else 
						ESX.ShowNotification('~g~Information~s~ :\nTu dois êtres en ~b~service~s~ pour acceder au ~o~garage~s~ !')
					end
				end
			end
		end
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("cs_andreas")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_andreas", ped, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    GiveWeaponToPed(ped, GetHashKey("WEAPON_STUNGUN"), 2800, true, true)
end)