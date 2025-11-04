-- Floating sidebar wibox
local sidebar = {
    tasklist = require('conf.widgets.sidebar.tasklist')
}

function sidebar.new(args)
    local args     = args or {}
    local screen   = args.screen
    local position = args.position or "bottom_right"
    local width    = args.width or screen.geometry.width/6
    local height   = args.height or screen.geometry.height
    local opacity  = args.opacity or 1

    local sidebar = wibox({ screen = screen, visible = fase, ontop = true,
        width = width, height = height, opacity = opacity })

    awful.placement.align(sidebar, { position = position })

    return sidebar
end

return conf.helpers.tablefunc(sidebar, sidebar.new)
