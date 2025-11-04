-- Custom functions used all over the config
local helpers={ 
    markup = require('conf.markup') -- shamelessely stolen
}

-- {{{ startup()
-- run startup apps script
function helpers.startup()
    if not os.getenv("XEPHYR") then
        awful.spawn(os.getenv('HOME') .. "/.xstartup/init")
    end
end
-- }}}

-- {{{ set_wallpaper()
function helpers.set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end
-- }}}

--{{{ lua_prompt()
-- lua prompt for keybinds
function helpers.lua_prompt()
    awful.prompt.run {
        prompt       = "Run Lua code: ",
        textbox      = awful.screen.focused().promptbox.widget,
        exe_callback = awful.util.eval,
        history_path = awful.util.get_cache_dir() .. "/history_eval"
    }
end
--}}}

-- {{{ maximize(client)
function helpers.maximize(client)
    client.maximized = not client.maximized
    client:raise()
end
-- }}}

-- {{{ cycle_clients()
-- Alt tab like behaviour
function helpers.cycle_clients()
    awful.client.focus.byidx(1)
    if client.focus then
        client.focus:raise()
    end
end
-- }}}

-- {{{ term_spawn(cmd)
-- Spawn a program inside a terminal
function helpers.term_spawn(cmd)
	-- execute the command inside a new terminal
	if cmd and cmd ~= "" then
		cmd = conf.vars.terminal .. " -e " .. cmd
		return awful.spawn(cmd)
	end
end
-- }}}

-- {{{ swap_master(client)
-- This function will swap the current client with the master client.
helpers._last_master={}
function helpers.swap_master(client)
	local tag      = awful.tag.selected()
	local master   = awful.client.getmaster()
	local previous = helpers._last_master[tag]

	if client == master and previous ~= nil then
        previous:swap(client)
        previous:jump_to(false)
        helpers._last_master[tag] = client
	elseif client ~= master then
		client:swap(master)
		helpers._last_master[tag] = master
	end
end
-- }}}

-- {{{ iconize(str [,size])
-- return a string containing an icon from a patched font
function helpers.iconize(str, size)
    local str = str or ''
    local size = size or math.floor(conf.vars.fontsize * 1.5)
    return string.format('<span font="%s %s">%s</span>', conf.vars.iconfont, size, str)
end
--}}}

-- {{{ colorize(str, color)
-- return a markup with str colorized using color
function helpers.colorize(str, color)
    return '<span color="' .. color .. '">' .. str .. '</span>'
end
-- }}}

-- {{{ splitstr(str, sep)
-- this should have been in the string lua lib but oh well
function helpers.splitstr(inputstr, sep)
    local sep = sep or "%s"
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            t[i] = str
            i = i + 1
    end
    return t
end
-- }}}

-- {{{ tablefunc(table, callable)
-- Because i keep forgetting the syntax :(
function helpers.tablefunc(table, callable)
    return setmetatable(table, { __call = function(_, ...) return callable(...) end })
end
-- }}}

-- {{{ magnify_client(c, width_f, height_f)
-- Magnify a client: set it to "float" and resize it.
-- taken from awesome-lain https://github.com/lcpz/lain
function helpers.magnify_client(c, width_f, height_f)
    if c and not c.floating then
        helpers.magnified_client = c
        c.floating   = true
        local s      = awful.screen.focused()
        local mg     = s.workarea
        local g      = {}
        local mwfact = width_f or s.selected_tag.master_width_factor or 0.5
        g.width      = math.sqrt(mwfact) * mg.width
        g.height     = math.sqrt(height_f or mwfact) * mg.height
        g.x          = mg.x + (mg.width - g.width) / 2
        g.y          = mg.y + (mg.height - g.height) / 2

        if c then c:geometry(g) end -- if c is still a valid object
    else
        helpers.magnified_client = nil
        c.floating = false
    end
end
-- }}}

-- {{{ add_keybind(keybind)
-- add a new keybind
function helpers.add_keybind(keybind)
    root.keys(awful.util.table.join(root.keys(), keybind))
end
-- }}}

return helpers
-- vim: fdm=marker
