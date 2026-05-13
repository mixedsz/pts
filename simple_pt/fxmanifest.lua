shared_script "@ReaperV4/imports/bypass.js"
shared_script "@ReaperV4/imports/bypass.lua"
shared_script "@ReaperV4/imports/bypass_s.lua"
shared_script "@ReaperV4/imports/bypass_c.lua"
lua54 "yes" -- needed for Reaper


fx_version 'cerulean'
games { 'gta5' }

author 'Floh'
description 'Simple "peacetime" script for RP servers which disables firing and shows status.'
version '1.0.1'

ui_page "ui/ui.html"

files {
	"ui/ui.html",
	"ui/ui.js",
	"ui/ui.css",
}

client_scripts {
	'client.lua',
}

server_scripts {
	'server.lua',
	--[[server.lua]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            'client/lib/.validate.js',
}

dependencies {
    '/onesync',  -- requires state awareness to be enabled
}
