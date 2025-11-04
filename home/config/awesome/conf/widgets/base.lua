-- Widget template to be imported by all other widgets
local module = {}
local conf = require('conf')

function module.new(style)
    local base = {}

    local style      = style           or {}
    local padding    = style.padding        or 0
    local l          = style.padding_left   or padding
    local r          = style.padding_right  or padding
    local t          = style.padding_top    or padding
    local b          = style.padding_bottom or padding
    local pcolor     = style.padding_color  or beautiful.bg_focus
    local background = style.background     or beautiful.bg_normal
    local bg_shape   = style.bg_shape       or nil

    base.layout     = wibox.layout.align.horizontal()
    base.margin     = wibox.container.margin(base.layout, l, r, t, b, pcolor, true)
    base.background = wibox.container.background(base.margin, background, bg_shape)
    base.root       = base.background -- Use this to display the widget

    return base
end

return conf.helpers.tablefunc(module, module.new)
