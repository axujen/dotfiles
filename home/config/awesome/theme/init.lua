local os=require('os')

-- base colorscheme
local colorscheme = "blackburn"
local theme_dir   = conf.vars.path.theme .. "/" .. colorscheme
local theme       = dofile(theme_dir .. '/theme.lua')
theme.dir         = theme_dir

-- Wallpaper
theme.wallpaper   = conf.vars.path.home .. '/pictures/wallpaper'

-- Gaps and borders
theme.gap_single_cient = false
theme.useless_gap      = 0
theme.border_width     = 2

-- Font
theme.font = string.format("%s %s", conf.vars.font, conf.vars.fontsize)

-- {{{ Progress bars
theme.progressbar_fg = theme.fg_focus
theme.progressbar_bg = theme.fg_normal
-- }}}

-- {{{ Transparency
theme.alpha     = "FF"
theme.notify_bg = theme.notify_bg or theme.bg_normal
theme.notify_bg = theme.notify_bg .. theme.alpha
theme.bg_normal = theme.bg_normal   .. theme.alpha
theme.bg_urgent = theme.bg_urgent   .. theme.alpha
theme.bg_focus  = theme.bg_focus    .. theme.alpha
-- }}}

-- initialize the theme here
beautiful.init(theme)
return theme
-- vim: fdm=marker
