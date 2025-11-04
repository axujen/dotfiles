-- Alsa volume widget
-- TODO: Vertical volume bar
local module = {}
local conf = require('conf')

local wibox     = require('wibox')

function module.new(args)
    local args = args or {}
    alsa = conf.widgets.base{style = args.style}

    alsa.icon   = wibox.widget.textbox(conf.helpers.iconize(''))
    alsa.widget = conqueror.textbox(' $mixer%')

    alsa.layout:set_left(alsa.icon)
    alsa.layout:set_middle(alsa.widget)

    return alsa.root
end

return conf.helpers.tablefunc(module, module.new)
