-- Variable definitions
local vars = {}
local os = require('os')

-- {{{ Configurable options
vars.modkey        = 'Mod4'
vars.terminal      = 'urxvt'
vars.editor        = 'gvim'
vars.browser       = "firefox"
vars.minibrowser   = "qutebrowser"
vars.font          = "Droid Sans Bold"
vars.fontsize      = "8"
vars.nerdfont      = "RobotoMono NF Regular"
vars.audio_channel = 'Master' -- Audio channel for volume change
vars.battery_dev   = 'BAT0'
vars.ac_dev        = 'ac'
vars.titlebars     = false -- enable titlebars for normal clients
-- }}}

-- {{{ Layouts
-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.tile,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.floating,

    -- Complete list for reference
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.tile,
    -- awful.layout.suit.floating,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Floating Clients
-- List of floating clients
vars.floating_clients = {
	"Viewnior", "mpv", "MPlayer", "Wine", "feh"
}
-- }}}

-- {{{
vars.path = {}
vars.path.home   = os.getenv('HOME')
vars.path.config = awful.util.getdir("config")
vars.path.theme  = vars.path.config .. "theme"
vars.path.icons  = vars.path.config .. "theme/icons"
-- }}}

return vars
-- vim: fdm=marker
