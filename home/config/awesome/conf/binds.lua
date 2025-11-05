-- Custom keybinds
local keybinds = {}
local conf = require('conf')

local modkey = conf.vars.modkey or 'Mod4'

-- {{{ Global Keybinds
keybinds.keys = {}

-- {{{ Awesome
keybinds.keys["awesome"] = {
    {{ modkey, }, "/", hotkeys_popup.show_help, "show help"},
    {{ modkey, "Control" }, "r", awesome.restart, "reload awesome"},
    {{ modkey, "Shift"   }, "q", awesome.quit, "quit awesome"},
}
-- }}}

-- {{{ Layout
keybinds.keys["layout"] = {
    {{ modkey,           }, "space", function() awful.layout.inc( 1)  end, "select next"},
    {{ modkey, "Shift"   }, "space", function() awful.layout.inc(-1)  end, "select previous"},
}
-- }}}

-- {{{ Prompts
keybinds.keys["prompt"] = {
    {{ modkey }, "r", function() awful.screen.focused().promptbox:run() end, "run prompt"},
    {{ modkey }, "w", function() menubar.show() end, "show the menubar"},
    {{ modkey }, "x", function() conf.helpers.lua_prompt() end, "lua execute prompt"},
}
-- }}}

-- {{{ Client Manipulation
keybinds.keys["client"] = {
    {{ modkey }, "Tab", conf.helpers.cycle_clients, "cycle clients"},
    {{ modkey }, "u", awful.client.urgent.jumpto, "jump to urgent client"},

    -- Movement
    {{ modkey }, "h", function() awful.client.focus.bydirection("left") end,  "Focus left client" },
	{{ modkey }, "l", function() awful.client.focus.bydirection("right")end,  "Focus right client" },
	{{ modkey }, "j", function() awful.client.focus.bydirection("down") end,  "Focus bottom client" },
	{{ modkey }, "k", function() awful.client.focus.bydirection("up")   end,  "Focus top client" },

    -- Swaping
	{{ modkey, "Shift"   }, "h", function() awful.client.swap.bydirection("left") end, "Swap with left client" },
	{{ modkey, "Shift"	 }, "j", function() awful.client.swap.bydirection("down") end, "Swap with right client" },
	{{ modkey, "Shift"   }, "l", function() awful.client.swap.bydirection("right")end, "Swap with bottom client" },
	{{ modkey, "Shift"	 }, "k", function() awful.client.swap.bydirection("up")	  end, "Swap with top client" },

    -- Resizing
	{{ modkey, "Control" }, "h", function() awful.tag.incmwfact(-0.02)  end, "Resize to the left" },
	{{ modkey, "Control" }, "j", function() awful.client.incwfact(-0.02)end, "Resize to the bottom" },
	{{ modkey, "Control" }, "k", function() awful.client.incwfact(0.02) end, "Resize to the right" },
	{{ modkey, "Control" }, "l", function() awful.tag.incmwfact(0.02)   end, "Resize to the top" },
}
-- }}}

-- {{{ Media Controls
keybinds.keys["media controls"] = {
    {{          }, "XF86AudioPlay", function() awful.spawn("mpc toggle") end,            "Play/Pause Song"},
    {{          }, "XF86AudioNext", function() awful.spawn("mpc next") end,              "Play Next Song"},
    {{          }, "XF86AudioPrev", function() awful.spawn("mpc prev") end,              "Play Previous Song"},
    {{"Shift"   }, "XF86AudioNext", function() awful.spawn("mpc seek +5%") end,          "Seek forward"},
    {{"Shift"   }, "XF86AudioPrev", function() awful.spawn("mpc seek -5%") end,          "Seek backwards"},
    {{"Control" }, "XF86AudioPlay", function() awful.spawn("mpc seek 0%") end,           "Restart song"},
    
    -- mpdrandom
    {{"Shift"   }, "XF86AudioPlay", function() awful.spawn.with_shell("mpdrandom") end, "Play a random album from the playlist"},
    {{          }, "#84",           function() awful.spawn.with_shell("mpc clear && mpdrandom -l") end, "Play a random album from the library"},
    
    -- Volume
    {{          }, "XF86AudioRaiseVolume", function() awful.spawn("amixer set Master 5%+") end, "Volume Up"	},
    {{          }, "XF86AudioLowerVolume", function() awful.spawn("amixer set Master 5%-") end, "Volume Down"},
    {{modkey    }, "=", function() awful.spawn("amixer set Master 5%+") end, "Volume Up"	},
    {{modkey    }, "-", function() awful.spawn("amixer set Master 5%-") end, "Volume Down"},
    {{"Control" }, "XF86AudioRaiseVolume", function() awful.spawn("mpc volume +5") end, "Music Volume Up"},
    {{"Control" }, "XF86AudioLowerVolume", function() awful.spawn("mpc volume -5") end, "Music Volume Down"},
}
-- }}}

-- {{{ Display Controls
keybinds.keys["display controls"]={
    {{ modkey,	}, ";",	                    function() awful.spawn("redshift-toggle") end,   "Toggle redshift"},
    {{ modkey,  }, "q",                     function() awful.spawn("xscreensaver-command --lock") end, "Lock the screen"},

    -- Brightness
    {{          }, "XF86MonBrightnessDown", function() awful.spawn("light -U 5") end,        "Brightness down"},
    {{          }, "XF86MonBrightnessUp",   function() awful.spawn("light -A 5") end,        "Brightness up"},
    {{ modkey   }, "[",                     function() awful.spawn("light -U 5") end,        "Brightness down"},
    {{ modkey   }, "]",                     function() awful.spawn("light -A 5") end,        "Brightness up"},

    -- Screenshots
    {{          }, "Print", function() awful.spawn.with_shell("scrot -s  $HOME/pictures/screenshots/screenshot-%s.png") end, "Screenshot"},
    {{ "Shift"  }, "Print", function() awful.spawn.with_shell( "scrot -s - | xclip -selection clipboard -t image/png" ) end, "Screenshot to Clipboard"}
}
-- }}}

-- {{{ Program Launchers
keybinds.keys["launcher"]={
    -- GUI
    {{ modkey, "Shift"  }, "r",	function() awful.spawn('rofi -show run') end,            "rofi launcher"},
    {{ modkey,			}, "b",	function() awful.spawn(conf.vars.browser) end,           "web browser"},
    {{ modkey, "Shift"  }, "b",	function() awful.spawn(conf.vars.minibrowser) end,       "small web browser"},
    {{ modkey,			}, "v",	function() awful.spawn("gvim") end,                      "gvim"},

    -- Term
    {{ modkey,          }, "Return", function() awful.spawn(conf.vars.terminal) end, "open a terminal" },
    {{ modkey,			}, "e",		 function() conf.helpers.term_spawn("ranger") end,        "ranger"},
    {{ modkey,			}, "a",		 function() conf.helpers.term_spawn("ncmpcpp") end,       "ncmpcpp"},
    {{ modkey,			}, "i",		 function() conf.helpers.term_spawn("htop -u " .. os.getenv("USER")) end,          "htop user processes"},
    {{ modkey, "Shift"  }, "Return", function() conf.helpers.term_spawn('tmux new-session -c "$HOME" -A -t "$USER"') end, "tmux session"},
}
-- }}}
-- {{{ Simulate Scroll Wheel
keybinds.keys["mouse"] = {
    {{ modkey,          }, "Prior",    function() awful.spawn.with_shell('xdotool click 4') end, "Scroll Wheel Up" },
    {{ modkey,          }, "Next",  function() awful.spawn.with_shell('xdotool click 5') end, "Scroll Wheel Down" },
}

-- }}}

-- {{{ Tag Movement
keybinds.keys["tag"] = {
    {{ modkey }, "Right",  awful.tag.viewnext, "view next"},
    {{ modkey }, "Left",   awful.tag.viewprev, "view previous"},
    {{ modkey }, "Escape", awful.tag.history.restore, "last tag"},
}
-- }}}

-- {{{ Tag Keys
-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
keybinds.tagkeys = {}
for i = 1, 9 do
    keybinds.tagkeys = gears.table.join(keybinds.tagkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end
-- }}}

-- {{{ Merge keybinds
function keybinds.merge(keys)
    local keys = keys
    local globalkeys = {}

    for gname,group in pairs(keys) do
        for _,keydef in pairs(group) do
            local mod,button,exec,desc = keydef[1],keydef[2],keydef[3],keydef[4]

            if type(mod) == "string" then
                globalkeys = gears.table.join( globalkeys, awful.key({ mod }, button, exec, { description=desc, group=gname }) )
            elseif type(mod) == "table" then
                globalkeys = gears.table.join( globalkeys, awful.key( mod, button, exec, { description=desc, group=gname }) )
            end
        end
    end

    return globalkeys
end

-- Set the keybinds
keybinds.globalkeys=keybinds.merge(keybinds.keys)
root.keys(gears.table.join(keybinds.globalkeys, keybinds.tagkeys))
-- }}}
-- }}}

-- {{{ Client Keybinds
keybinds.client = gears.table.join(
    awful.key({ modkey,          }, "d", function(c) conf.helpers.magnify_client(c) end, { description = "magnify client", group = "client" }),
    awful.key({ modkey,          }, "n", function(c) conf.helpers.maximize(c) end, {description = "(un)maximize", group = "client"}),
    awful.key({ modkey,          }, "m", function(c) conf.helpers.swap_master(c) end, { description = "swap master client", group = "client" }),
    awful.key({ modkey,          }, "f", function(c) c.fullscreen = not c.fullscreen c:raise() end, {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"  }, "f", awful.client.floating.toggle, {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Shift"  }, "c", function(c) c:kill() end, {description = "close", group = "client"}),
    awful.key({ modkey,          }, "o", function(c) c:move_to_screen() end, {description = "move to screen", group = "client"}),
    awful.key({ modkey,          }, "t", function(c) c.ontop = not c.ontop end, {description = "toggle keep on top", group = "client"})
)
-- }}}

-- {{{ Client Buttons
keybinds.clientbuttons = gears.table.join(
    awful.button({ }, 1, function(c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 2, awful.mouse.client.resize)
)
-- }}}

-- {{{ Mouse Bindings
root.buttons(awful.button({ }, 3, function() mymainmenu:toggle() end))
-- }}}

return keybinds
-- vim: fdm=marker
