fx_version 'cerulean'
game 'gta5'

author 'TowTruckSystem'
description 'towing work and boss menu clothing menu a lifting and lowering platform in a tow truck where you can'
version '1.0.0'

dependencies {
    'es_extended'
}

client_scripts {
    'client.lua',
    'client/*.lua'
}

server_scripts {
    'server.lua',
    'server/*.lua'
}

shared_scripts {
    'config.lua',
    'shared.lua'
}

ui_page 'html/index.html'

files {
    'html/*.html',
    'html/*.css',
    'html/*.js'
}
