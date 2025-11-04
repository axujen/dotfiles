-- vim: foldmethod=marker
-- Standard awesome library
gears         = require("gears")
awful         = require("awful")
wibox         = require("wibox")
beautiful     = require("beautiful")
naughty       = require("naughty")
menubar       = require("menubar")
require("awful.autofocus")
hotkeys_popup = require("awful.hotkeys_popup").widget
-- require("awful.hotkeys_popup.keys") -- adds app specific keybind help ie: tmux,vim

require('error_handler')

-- Third party modules
-- conqueror = require('ext.conqueror')
-- conqueror.conky_launch('/home/user/.config/awesome/ext/conqueror/conky')

-- Configuration
conf         = require('conf')
theme        = require('theme') -- TODO: Fix theme requiring lain
menu         = require('menu')
conf.widgets = require('conf.widgets')
conf.ui      = require('conf.ui')
conf.binds   = require('conf.binds') -- key and mouse binds
conf.rules   = require('conf.rules')
conf.signals = require('conf.signals')

conf.helpers.startup()
