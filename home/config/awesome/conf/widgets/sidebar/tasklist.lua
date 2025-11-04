-- Vertical tasklist, stolen from https://stackoverflow.com/questions/31293571/awesome-wm-setting-size-for-the-tasklist-item 
-- and https://github.com/ThePinkPanther/MinimalAwesome/blob/master/popup_toolbar.lua
local module = {}

local common = require('awful.widget.common')

function module.new(args)
    local tasklist = {}

    local args    = args or {}
    local screen  = args.screen
    local filter  = args.filter or awful.widget.tasklist.filter.currenttags
    local style   = args.style or {}
    local size    = args.size or 20
    local buttons = args.buttons or awful.util.table.join(awful.button({}, 1, function(c)
        if not c:isvisible() then
            c:tags()[1]:view_only()
        end
        client.focus = c
        c:raise()
    end))

    local function list_update(w, buttons, label, data, cls)
        common.list_update(w, buttons, label, data, cls)
        w:set_max_widget_size(size)
    end

    tasklist.widget = awful.widget.tasklist(screen, filter, buttons, style, list_update, wibox.layout.flex.vertical())

    return tasklist.widget
end

return conf.helpers.tablefunc(module, module.new)
