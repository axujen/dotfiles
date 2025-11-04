-- Systray around hideable wrapper
module = {}
local conf = require('conf')
conf.binds = require('conf.binds')

function module.new(args)
    local args = args or {}
    args.mods  = args.mods or { "Mod4" }
    args.key   = args.key or "c"

    local systray = wibox.widget.textbox(conf.helpers.iconize(""))
    local minitray = require('conf.minitray')
    local keybind = awful.key(args.mods, args.key, function() minitray.toggle() end )

    conf.helpers.add_keybind(keybind)
    systray:connect_signal("button::press", function() minitray.toggle() end)

    -- so apps can properly set their icons on startup
    minitray.show()
    minitray.hide()

    return systray
end

return conf.helpers.tablefunc(module, module.new)
