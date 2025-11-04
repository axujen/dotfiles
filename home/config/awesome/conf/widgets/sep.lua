-- global widget seperator
local conf = require('conf')

local function factory(args)
    local args = args or {}
    local sep  = args.sep or conf.helpers.iconize("")

    return wibox.widget.textbox(string.format(" %s ", sep))
end

return factory
