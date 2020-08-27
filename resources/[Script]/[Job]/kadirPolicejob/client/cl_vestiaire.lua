ESX = nil
onDuty = false

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

local gilet = false
local giletballe = false

RMenu.Add('vestiaire', 'main', RageUI.CreateMenu("Vestiaire", "Prennez votre ~o~tenue~s~ !"))

Citizen.CreateThread(function()
    local pPed = GetPlayerPed(-1)
    local onservice = false
    local serviceonoff = false

    while true do


        RageUI.IsVisible(RMenu:Get('vestiaire', 'main'), function()
            in_menu = true 

            RageUI.Checkbox("Activer / Desactiver son service",nil, serviceonoff,{},function(Hovered,Ative,Selected,Checked)
                if Selected then
                    local pName = GetPlayerName(source)
          
                    serviceonoff = Checked

                    if Checked then
                        onservice = true
                        TriggerServerEvent("player:serviceOn", "police")
                        
                        local lib, anim = 'clothingtrousers', 'try_trousers_neutral_c'
                        ESX.Streaming.RequestAnimDict(lib, function()
                            TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                        end)

                        Citizen.Wait(1500)

                        ESX.ShowNotification('~g~Information~s~ :\nVous venez de vous mettre en ~b~galçon~s~ veuillez mettre votre ~g~Tenue~s~ !')

                        TriggerEvent('skinchanger:getSkin', function(skin)
                            if skin.sex == 0 then
                                    TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.nue_wear.male)
                            elseif skin.sex == 1 then
                                    TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.nue_wear.female)
                            end
                    end)
        
                        if ESX.PlayerData.job.name == 'police' then 
                            ESX.ShowAdvancedNotification('LSPD INFORMATIONS', '~b~Service', 'L\'Agent ~b~'..pName..' ~s~viens de ~g~prendre~s~ son service', 'CHAR_CALL911', 8)
                        end
                    else
                        onservice = false
                        TriggerEvent("esx_policejob:offDuty")
                        TriggerServerEvent("player:serviceOff", "police")

                        -- Tenue civil

                        SetPedArmour(pPed, 0)

                        local lib, anim = 'clothingshoes', 'try_shoes_positive_a'
                        ESX.Streaming.RequestAnimDict(lib, function()
                            TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                        end)
        
                        ESX.ShowNotification("Vous ~g~commencer~s~ a vous ~g~déshabillez~s~ ...")
        
                        Citizen.Wait(5000)
        
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            if skin.sex == 0 then
                                    TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.nue_wear.male)
                            elseif skin.sex == 1 then
                                    TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.nue_wear.female)
                            end
                    end)
        
                        local lib, anim = 'clothingtie', 'try_tie_neutral_a'
                        ESX.Streaming.RequestAnimDict(lib, function()
                            TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                        end)
                        Citizen.Wait(5000)
        
                        SetPedArmour(pPed, 0)	
        
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                            TriggerEvent('skinchanger:loadSkin', skin)
                        end) 
                        -- Fin tenue

                        if ESX.PlayerData.job.name == 'police' then 
                            ESX.ShowAdvancedNotification('LSPD INFORMATIONS', '~b~Service', 'L\'Agent ~b~'..pName..'~s~ viens de ~r~quitter~s~ son service', 'CHAR_CALL911', 8)
                        end
                    end
                end
            end)
        
            if onservice then
                

            
                RageUI.Button("Tenue de service", nil, {}, true, function(Hovered, Active, Selected)
                    if (Selected) then

                            if ESX.PlayerData.job.grade_name == 'recruit' then


        
                                local lib, anim = 'clothingtie', 'try_tie_neutral_a'
                                ESX.Streaming.RequestAnimDict(lib, function()
                                    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                                end)
        
                                ESX.ShowNotification("Vous ~g~commencer~s~ a vous ~g~habillez~s~ ...")
        
                                Citizen.Wait(5000)
        
                                TriggerEvent('skinchanger:getSkin', function(skin)
                                    if skin.sex == 0 then
                                            TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.recruit_wear.male)
                                    elseif skin.sex == 1 then
                                            TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.recruit_wear.female)
                                    end
                                end)
                            elseif ESX.PlayerData.job.grade_name == 'officer' then 
        

        
                                local lib, anim = 'clothingtie', 'try_tie_neutral_a'
                                ESX.Streaming.RequestAnimDict(lib, function()
                                    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                                end)
        
                                ESX.ShowNotification("Vous ~g~commencer~s~ a vous ~g~habillez~s~ ...")
        
                                Citizen.Wait(5000)
        
                                TriggerEvent('skinchanger:getSkin', function(skin)
                                    if skin.sex == 0 then
                                            TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.officer_wear.male)
                                    elseif skin.sex == 1 then
                                            TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.officer_wear.female)
                                    end
                                end)
                            elseif ESX.PlayerData.job.grade_name == 'sergeant' then
        

        
                                local lib, anim = 'clothingtie', 'try_tie_neutral_a'
                                ESX.Streaming.RequestAnimDict(lib, function()
                                    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                                end)
        
                                ESX.ShowNotification("Vous ~g~commencer~s~ a vous ~g~habillez~s~ ...")
        
                                Citizen.Wait(5000)
        
                                TriggerEvent('skinchanger:getSkin', function(skin)
                                    if skin.sex == 0 then
                                            TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.sergeant_wear.male)
                                    elseif skin.sex == 1 then
                                            TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.sergeant_wear.female)
                                    end
                            end)
                            elseif ESX.PlayerData.job.grade_name == 'lieutenant' then
        

        
                                local lib, anim = 'clothingtie', 'try_tie_neutral_a'
                                ESX.Streaming.RequestAnimDict(lib, function()
                                    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                                end)
        
                                ESX.ShowNotification("Vous ~g~commencer~s~ a vous ~g~habillez~s~ ...")
        
                                Citizen.Wait(5000)
                                
                                TriggerEvent('skinchanger:getSkin', function(skin)
                                    if skin.sex == 0 then
                                            TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.lieutenant_wear.male)
                                    elseif skin.sex == 1 then
                                            TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.lieutenant_wear.female)
                                    end
                                end)
                            elseif ESX.PlayerData.job.grade_name == 'boss' then
        

        
                                local lib, anim = 'clothingtie', 'try_tie_neutral_a'
                                ESX.Streaming.RequestAnimDict(lib, function()
                                    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                                end)
        
                                ESX.ShowNotification("Vous ~g~commencer~s~ a vous ~g~habillez~s~ ...")
        
                                Citizen.Wait(5000)
        
                                TriggerEvent('skinchanger:getSkin', function(skin)
                                    if skin.sex == 0 then
                                            TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.boss_wear.male)
                                    elseif skin.sex == 1 then
                                            TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.boss_wear.female)
                                    end
                                end) 
                            end
   
                        TriggerEvent("esx_policejob:onDuty")     
                    end
                end)          
                
                if ESX.PlayerData.job.grade_name == 'recruit' then 

                RageUI.Checkbox("Gilet ~o~orange",nil, gilet,{},function(Hovered,Ative,Selected,Checked)
                    if Selected then
                        local pName = GetPlayerName(source)
    
                        gilet = Checked
    
                        if Checked then
                            if onDuty then
                                ESX.ShowNotification("Vous ~g~commencez~w~ a ~g~enfiler votre~s~ gilet ~o~orange ...")
                
                                local lib, anim = 'clothingshoes', 'try_shoes_positive_a'
                                ESX.Streaming.RequestAnimDict(lib, function()
                                    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                                end)
                
                                Citizen.Wait(5000)
                
                                TriggerEvent('skinchanger:getSkin', function(skin)
                                    if skin.sex == 0 then
                                            TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.gilet_wear.male)
                                    elseif skin.sex == 1 then
                                            TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.gilet_wear.female)
                                    end
                                end)
                            else 
                                ESX.ShowNotification('~r~Vous devez avoir votre tenue de service .')
                                gilet = false
                            end
                        else
                            TriggerEvent('skinchanger:change', 'tshirt_1', 0)
                            TriggerEvent('skinchanger:change', 'tshirt_2', 0)
                        end
                    end
                end)

            end

            if ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant' or ESX.PlayerData.job.grade_name == 'boss' then

                    RageUI.Checkbox("Gilet par ~r~balle",nil, giletballe,{},function(Hovered,Ative,Selected,Checked)
                        if Selected then
                            local pName = GetPlayerName(source)
        
                            giletballe = Checked
        
                            if Checked then
                                if onDuty then
                                    ESX.ShowNotification("Vous ~g~commencez~w~ a ~g~enfiler votre~s~ gilet par ~r~balle ...")
            
                                    local lib, anim = 'clothingshoes', 'try_shoes_positive_a'
                                    ESX.Streaming.RequestAnimDict(lib, function()
                                        TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                                    end)
                                    Citizen.Wait(1500)
                                    TriggerEvent('skinchanger:getSkin', function(skin)
                                    if skin.sex == 0 then
                                        TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.bullet_wear.male)
                                    elseif skin.sex == 1 then
                                        TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.bullet_wear.female)
                                    end
                                    SetPedArmour(pPed, 200)
                                end)
                                else 
                                    ESX.ShowNotification('~r~Vous devez avoir votre tenue de service .')
                                    SetPedArmour(pPed, 0)
                                    giletballe = false
                                end
                            else
                                TriggerEvent('skinchanger:change', 'bproof_1', 0)
                                TriggerEvent('skinchanger:change', 'bproof_2', 0)
                            end
                        end
                    end)

                end
            else

                RageUI.Button("Tenue de service", nil, {RightBadge = RageUI.BadgeStyle.Lock}, true, function(Hovered, Active, Selected)
                end)
                RageUI.Button("Gilet orange", nil, {RightBadge = RageUI.BadgeStyle.Lock}, true, function(Hovered, Active, Selected)  
                end)
                RageUI.Button("Gilet par balle", nil, {RightBadge = RageUI.BadgeStyle.Lock}, true, function(Hovered, Active, Selected)  
                end)
            end
        end, function()
        end, 1)
        Citizen.Wait(0)
    end
    end)

--- Menu de la positon


local position = {
    {x = 452.12, y = -993.31, z = 30.69},
    {x = 457.32, y = -988.31, z = 30.69},
    {x = 458.05, y = -993.31, z = 30.69}
}    

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(position) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
            if ESX.PlayerData.job.name == 'police' then 
                if dist <= 0.6 then
                    ESX.DrawMissionText("Appuyer sur ~w~[~b~E~w~] pour acceder au vestiaire")
                    if IsControlJustPressed(1,51) then
                        RageUI.Visible(RMenu:Get('vestiaire', 'main'), not RageUI.Visible(RMenu:Get('vestiaire', 'main')))
                    end
                end
            end
        end
    end
end)



-- Fin menu postition
