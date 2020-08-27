ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_policejob:AddTazer')
AddEventHandler('esx_policejob:AddTazer', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.addWeapon('WEAPON_STUNGUN', 999)
	TriggerClientEvent('esx:showAdvancedNotification', source, 'LSPD', '~b~Annonce LSPD', "Vous venez de recevoir ~g~1x ~b~ Tazer de 26 Volts !", 'CHAR_CALL911', 8)
end)

RegisterServerEvent('esx_policejob:AddMatraque')
AddEventHandler('esx_policejob:AddMatraque', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.addWeapon('WEAPON_NIGHTSTICK', 999)
	TriggerClientEvent('esx:showAdvancedNotification', source, 'LSPD', '~b~Annonce LSPD', "Vous venez de recevoir ~g~1x ~b~ Matraque !", 'CHAR_CALL911', 8)
end)

RegisterServerEvent('esx_policejob:AddPistol')
AddEventHandler('esx_policejob:AddPistol', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.addWeapon('WEAPON_PISTOL', 999)
	TriggerClientEvent('esx:showAdvancedNotification', source, 'LSPD', '~b~Annonce LSPD', "Vous venez de recevoir ~g~1x ~b~ Pistolet .", 'CHAR_CALL911', 8)
end)

RegisterServerEvent('esx_policejob:AddComPistol')
AddEventHandler('esx_policejob:AddComPistol', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.addWeapon('WEAPON_COMBATPISTOL', 999)
	TriggerClientEvent('esx:showAdvancedNotification', source, 'LSPD', '~b~Annonce LSPD', "Vous venez de recevoir ~g~1x ~b~ Pistolet de combat .", 'CHAR_CALL911', 8)
end)

RegisterServerEvent('esx_policejob:AddSmg')
AddEventHandler('esx_policejob:AddSmg', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.addWeapon('WEAPON_SMG', 999)
	TriggerClientEvent('esx:showAdvancedNotification', source, 'LSPD', '~b~Annonce LSPD', "Vous venez de recevoir ~g~1x ~b~ MP5 de 9MM !", 'CHAR_CALL911', 8)
end)

RegisterServerEvent('esx_policejob:AddCarabine')
AddEventHandler('esx_policejob:AddCarabine', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.addWeapon('WEAPON_CARBINERIFLE', 999)
	TriggerClientEvent('esx:showAdvancedNotification', source, 'LSPD', '~b~Annonce LSPD', "Vous venez de recevoir ~g~1x ~b~ Carabine Spécial !", 'CHAR_CALL911', 8)
end)

RegisterServerEvent('esx_policejob:AddPump')
AddEventHandler('esx_policejob:AddPump', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.addWeapon('WEAPON_PUMPSHOTGUN', 999) 
	TriggerClientEvent('esx:showAdvancedNotification', source, 'LSPD', '~b~Annonce LSPD', "Vous venez de recevoir ~g~1x ~b~ Fusil à Pompe.", 'CHAR_CALL911', 8)
end)

RegisterServerEvent('esx_policejob:AddGaz')
AddEventHandler('esx_policejob:AddGaz', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.addWeapon('WEAPON_BZGAS', 5) 
	TriggerClientEvent('esx:showAdvancedNotification', source, 'LSPD', '~b~Annonce LSPD', "Vous venez de recevoir ~g~1x ~b~ Fusil à Pompe.", 'CHAR_CALL911', 8)
end)