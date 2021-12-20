fx_version 'V1'

game 'gta5'


server_scripts {
    'config.lua',
	'server/main.lua',
    '@mysql-async/lib/MySQL.lua'
	
}

client_scripts {
    'config.lua',
	'client/main.lua'
}

ui_page "html/index.html"
files({
    'html/index.html',
    'html/index.js',
    'html/main.css',
    'html/Assets/Vector-1.svg',
    'html/Assets/Vector.svg',
    'html/Assets/card.svg',
    'html/Assets/logo.svg',
    'html/Assets/card.svg',
    'html/Assets/back.svg',
})