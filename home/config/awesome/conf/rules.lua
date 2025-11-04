awful.rules.rules = {
    -- {{{ Global rule
    { rule = { },
      properties = { border_width     = beautiful.border_width,
                     border_color     = beautiful.border_normal,
                     focus            = awful.client.focus.filter,
                     raise            = true,
                     keys             = conf.binds.client,
                     buttons          = conf.binds.clientbuttons,
                     screen           = awful.screen.preferred,
                     size_hints_honor = false,
                     placement        = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },
    -- }}}

    -- {{{ Custom rules
	{ rule = { class = "Keepassx" }, placement = awful.placement.centered },

    -- Music -> tag 7, browsers = tag 8, tmux = tag 9
	{ rule = { class = "cantata" }, properties = { tag = screen[1].tags[7] } },
    { rule = { name = "start-tmux", class = "URxvt" }, properties = { tag = screen[1].tags[9] } },
	{ rule_any = { class = {"Firefox", "firefox", "Pale moon", "Iceweasel", "qutebrowser"} },
		properties = { tag = screen[1].tags[8]} },

    -- Floating clients
	{ rule_any = { class = conf.vars.floating_clients }, properties = { floating = true } },

    -- Titlebars
    { rule_any = {type = { "normal" } }, properties = { titlebars_enabled = conf.vars.titlebars } },
    { rule_any = {type = { "dialog" } }, properties = { titlebars_enabled = true } },
    -- }}}
}
-- vim: fdm=marker
