local module = { widgets = {} }
local w = module.widgets

local conf = require('conf')

-- {{{ Widgets
-- global widgets
w.launcher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })
w.clock    = conf.widgets.clock()
w.systray  = conf.widgets.systray()
w.sep      = conf.widgets.sep()
w.space    = wibox.widget.textbox(" ")

-- screen widgets
function module.screen_widgets(s)
    s.promptbox = awful.widget.prompt()
    s.layoutbox = awful.widget.layoutbox(s)
    s.titlebar  = conf.widgets.titlebar(s)
    s.layoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end)))

    s.taglist = awful.widget.taglist(s, awful.widget.taglist.filter.all,
        awful.button({ }, 1, function(t) t:view_only() end))
end
-- }}}

-- {{{ Wibar
function module.screen_wibar(s)
    -- Create the widgets
    module.screen_widgets(s)

    -- Create the wibox
    s.wibar = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.wibar:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        s.layoutbox,
        s.taglist,
        s.promptbox,
        w.space,
    },
    s.titlebar, -- Middle widget
    { -- Right widgets
    layout = wibox.layout.fixed.horizontal,
    mykeyboardlayout,
    w.systray,
    w.space,
    w.space,
    w.clock,
},
    }
end
-- }}}

-- {{{ Setup
-- Create a wibar for each screen and add it
awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    conf.helpers.set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Wibar
    module.screen_wibar(s)
end)

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", conf.helpers.set_wallpaper)
-- }}}

return module
-- vim: fdm=marker
