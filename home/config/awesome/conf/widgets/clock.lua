-- Custom clock with calendar tooltip
local module = {}
local conf = require('conf')

function module.new(args)
    local args = args or {}
    local clock_i  = args.clock_icon or conf.helpers.iconize("")
    local cal_i    = args.calendar_icon or conf.helpers.iconize("")
    local date_format = args.date_format or "%a %b %d"
    local time_format = args.time_format or "%H:%M"

    return wibox.widget.textclock(string.format("%s %s %s %s", 
                                            cal_i,
                                            date_format,
                                            clock_i,
                                            time_format)
                                        )
end
return conf.helpers.tablefunc(module, module.new)
