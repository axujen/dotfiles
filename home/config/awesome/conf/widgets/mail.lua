-- Mail widget for maildir mailboxes
-- TODO: Manual update on click
local module = {}
local conf = require('conf')

local markup = require('lain.util.markup')
local os     = require('os')

function module.update()
    local data = mail._data
    local unread = 0

    for _, folder in pairs(data.folders) do
        local expr = string.format('${unseen_mails %s/%s}', data.dir, folder)
        local u = tonumber(conqueror(expr))
        if u and u > 0 then unread = unread + u end
    end

    if unread > 0 then
        mail.icon:set_markup(markup.fg.color(beautiful.fg_urgent, data.icon))
        mail.widget:set_markup(' ' .. markup.fg.color(beautiful.fg_urgent, tostring(unread)))
    else
        mail.icon:set_markup(markup.fg.color(beautiful.fg_normal, data.icon))
        mail.widget:set_text('')
    end
end

function module.new(args)
    local args    = args or {}
    local maildir = args.maildir or os.getenv('HOME') .. '/.mailbox'
    local folders = args.folders or {'INBOX'}

    mail = conf.widgets.base{style = args.style}
    mail._data = { 
        icon     = conf.helpers.iconize(''),
        folders  = folders,
        dir      = maildir,
    }
    mail.icon   = wibox.widget.textbox(mail._data.icon)
    mail.widget = wibox.widget.textbox()

    conqueror.on_update(module.update)

    mail.layout:set_left(mail.icon)
    mail.layout:set_middle(mail.widget)

    return mail.root
end

return conf.helpers.tablefunc(module, module.new)
-- vim: fdm=marker
