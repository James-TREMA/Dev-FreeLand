fx_version 'adamant'
games { 'gta5' };
description 'ESX Police Job'
version '1.3.0'

-- Dépendances

    -- RageUi
	client_scripts {
		"Dependances/src/RMenu.lua",
		"Dependances/src/menu/RageUI.lua",
		"Dependances/src/menu/Menu.lua",
		"Dependances/src/menu/MenuController.lua",
	
		"Dependances/src/components/*.lua",
	
		"Dependances/src/menu/elements/*.lua",
	
		"Dependances/src/menu/items/*.lua",
	
		"Dependances/src/menu/panels/*.lua",
	
		"Dependances/src/menu/windows/*.lua",
	
	
	}
        -- Fin Dep 
        
server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/br.lua',
	'locales/de.lua',
	'locales/en.lua',
	'locales/pl.lua',
	'locales/fr.lua',
	'locales/fi.lua',
	'locales/es.lua',
	'locales/sv.lua',
	'config.lua',
	'server/main.lua',
	'server/sv_armory.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/br.lua',
	'locales/de.lua',
	'locales/en.lua',
	'locales/pl.lua',
	'locales/fr.lua',
	'locales/fi.lua',
	'locales/es.lua',
	'locales/sv.lua',
	'config.lua',
	'client/alerte.lua',
	-- 'client/main.lua',
	'client/f6.lua',
	'client/cl_armory.lua',
	'client/cl_vestiaire.lua',
	'client/cl_garage.lua',
	'client/cl_appelle.lua'	
}
