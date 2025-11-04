-- Battery widget
-- TODO: Autodetect battery device
local module = {}
local conf = require('conf')

function module.update()
    local state,perc = unpack(conf.helpers.splitstr(conqueror(bat.expr)))

    if state then 
        bat.icon:set_markup(bat.icons[state]) 
    else
        bat.icon:set_markup(bat.icons["U"])
    end
    if perc then 
        bat.widget:set_text(' ' .. perc)
    else
        bat.widget:set_text('')
    end
end

function module.new(args)
    bat  = conf.widgets.base{style = args.style}
    local args = args or {}
    bat.dev    = args.dev or 'BAT1'
    bat.expr   = string.format('${battery_short %s}', bat.dev)


    bat.icons = {}
    bat.icons["C"] = conf.helpers.iconize("")
    bat.icons["D"] = conf.helpers.iconize(lain.util.markup.fg.color(beautiful.fg_urgent, ""))
    bat.icons["F"] = bat.icons["C"]
    bat.icons["U"] = bat.icons["C"]

    bat.icon   = wibox.widget.textbox(bat.icons["U"])
    bat.widget = wibox.widget.textbox()
    bat.layout:set_left(bat.icon)
    bat.layout:set_middle(bat.widget)

    conqueror.on_update(module.update)

    return bat.root
end

return conf.helpers.tablefunc(module, module.new)
