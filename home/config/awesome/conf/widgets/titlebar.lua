-- titlebar widget for the current focused client
local module = {}
local conf = require('conf')

module.titleclass = {}
function module.new( screen, style )
    local titlebar = {}
    setmetatable( titlebar, { __index = module.titleclass } )

    titlebar.widget        = conf.widgets.base{ style = style }
    titlebar.widget.middle = titlebar:titlewidget()
    titlebar.widget.left   = wibox.layout.fixed.horizontal()
    titlebar.widget.right  = wibox.layout.fixed.horizontal()
    titlebar.widget.layout:set_middle(titlebar.widget.middle)
    titlebar.widget.layout:set_left(titlebar.widget.left)
    titlebar.widget.layout:set_right(titlebar.widget.right)

    -- buttons
    titlebar.widget.right:add(titlebar:button(conf.helpers.iconize(" "), "close", function(self) self.client:kill() end).widget)

    titlebar:clear()
    client.connect_signal('focus', function(c) titlebar:update(c) end )
    client.connect_signal('unfocus', function(c) titlebar:clear() end )

    return titlebar.widget.root
end

function module.titleclass:update(client)
    if not self.client then
        self:show()
    end
    self.client = client
    self.widget.middle.update()
end

function module.titleclass:clear()
    self.client = nil
    self.widget.layout:set_middle(nil)
    self.widget.layout:set_left(nil)
    self.widget.layout:set_right(nil)
end

function module.titleclass:show()
    self.widget.layout:set_middle(self.widget.middle)
    self.widget.layout:set_left(self.widget.left)
    self.widget.layout:set_right(self.widget.right)
end

-- auto updating title widget
function module.titleclass:titlewidget()
    ret = wibox.widget.textbox()
    ret.update = function() 
        if self.client and self.client.name then
            ret:set_text(self.client.name)
        else
            ret:set_text('<unknown>')
        end
    end

    client.connect_signal('property::name', ret.update)
    return ret
end

-- auto updating buttons
function module.titleclass:button(icon, tooltip, action)
    local instance = {}
    instance.action = action

    instance.widget = wibox.widget.textbox(icon)
    instance.tooltip = awful.tooltip{timer_function=function() return tooltip end}
    instance.tooltip:add_to_object(instance.widget)

    instance.widget:buttons( awful.util.table.join(awful.button( {}, 1, function() action(self) end )))

    return instance
end

return conf.helpers.tablefunc(module, module.new)
