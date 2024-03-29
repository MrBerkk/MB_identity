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
fx_version 'adamant'

game 'gta5'

description 'ESX Skin'

version '1.1.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/de.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'locales/es.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/de.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'locales/es.lua',
	'config.lua',
	'client/main.lua'
}

dependencies {
	'es_extended',
	'skinchanger'
}
