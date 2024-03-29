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

description 'ESX Identity'

version '1.4.0'

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
	'locales/en.lua',
	'locales/es.lua',
	'locales/cs.lua',
	'locales/pl.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/es.lua',
	'locales/cs.lua',
	'locales/pl.lua',
	'config.lua',
	'client/main.lua'
}

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/js/script.js',
	'html/css/style.css',
	'html/img/esx_identity.png'
}

dependency 'es_extended'
