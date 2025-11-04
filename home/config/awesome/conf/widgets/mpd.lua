-- mpd widget
local module = {}
local conf = require('conf')

local markup = conf.helpers.markup
local os     = require('os')

-- {{{ Data
module._data = {}
module._data.icons = { Playing = "", Paused = "", Stopped = ""}
module._data.icons["MPD not responding"] = ""
-- }}}

-- {{{ Factory
function module.new(args)
    local data = module._data
    local args     = args           or {}
    args.style     = args.style     or {}
    args.max_len   = args.max_len   or 200
    args.timeout   = args.timeout   or 1
    data.music_dir = args.music_dir or os.getenv("HOME") .. "/music"

    mpd = conf.widgets.base{ style = args.style }

    -- Widget layout
    mpd.icon = wibox.widget.textbox()
    mpd.icon:set_markup(data.icons["MPD not responding"])

    -- Text
    mpd.textbox = wibox.container.scroll.horizontal()
    mpd.textbox.text   = wibox.widget.textbox()
    mpd.textbox.widget = mpd.textbox.text
    mpd.textbox:set_max_size(args.max_len)

    -- Progressbar
    mpd.progbar        = wibox.container.constraint(nil, "exact", args.max_len / 2, 10)
    mpd.progbar.bar    = wibox.widget.progressbar()
    mpd.progbar.widget = mpd.progbar.bar

    -- Combined text and progbar
    mpd.widget = wibox.layout.fixed.vertical()
    mpd.widget:add(mpd.textbox)
    mpd.widget:add(mpd.progbar)

    mpd.layout:set_left(mpd.icon)
    mpd.layout:set_middle(mpd.widget)

    mpd.root:buttons(awful.util.table.join(
        awful.button({ }, 1, function () awful.spawn("mpc toggle") end),
        awful.button({ }, 3, function () awful.spawn("mpdrandom -l") end))
    )

    -- conqueror.on_update(module.update)
    return mpd.root
end
-- }}}

-- {{{ Update function
function module.update()
    local data = module._data

    -- Conky side
    local title  = conqueror("$mpd_title")
    local status = conqueror("$mpd_status")
    local artist = conqueror("$mpd_artist")
    local album  = conqueror("$mpd_album")
    local file   = conqueror("$mpd_file")

    if status == "Playing" then -- update progressbar
        local perc   = tonumber(conqueror("$mpd_percent", 0))
        mpd.progbar.bar:set_value(perc / 100) -- progress bar takes values from 0 to 1
    end

    -- Playing, paused, stopped etc
    if status ~= data.last_status then
        module.on_status_change(status)
        data.last_status = status
    end

    -- If the song changed, update the info
    if status == "Playing" or status == "Paused" then
        if title ~= data.last_title or artist ~= data.last_artist or album ~= data.last_album then
            module.on_song_change(status, title, artist, album, file)
            data.last_title = title
            data.last_album = album
            data.last_artist = artist
        end
    end
end
-- }}}

-- {{{ on_song_change
function module.on_song_change(status, title, artist, album, file)
    local title  = title  or conqueror("$mpd_title")
    local artist = artist or conqueror("$mpd_artist")
    local album  = album  or conqueror("$mpd_album")
    local file   = file   or conqueror("$mpd_file")
    local data   = module._data

    -- Font and icons
    local sep    = conf.helpers.iconize("•")
    artist = markup.italic(artist)

    -- Update the main widget
    local text = string.format("%s %s %s ", title, sep, artist)
    mpd.textbox.text:set_markup(text)

    -- Show the progressbar
    if mpd.layout.middle ~= mpd.widget then mpd.layout:set_middle(mpd.widget) end
end
-- }}}

-- {{{ on_status_change
function module.on_status_change(status)
    if status == "Playing" then
        module.on_song_change(status)
    elseif status == "Paused" then
        module.on_song_change(status)
        mpd.layout:set_middle(mpd.textbox.container) -- hide the progressbar
    elseif status == "Stopped" then
        mpd.textbox.text:set_markup("Music Stopped")
        mpd.layout:set_middle(mpd.textbox.container) -- hide the progressbar
    else
        mpd.textbox.text:set_markup("N/A")
        mpd.layout:set_middle(mpd.textbox.container) -- hide the progressbar
    end
    mpd.icon:set_markup(conf.helpers.iconize(module._data.icons[status]) .. " ") -- Update the icon
end
-- }}}

-- {{{ Notification
function module.notify(image, title, artist, album)
    local artist = markup.italic(artist)
    local album  = markup.underline(album)
    local body = string.format("%s by %s\n\n%s", title, artist, album)

    notification = naughty.notify({ title = "Now Playing:", text = body, icon = image })
    notification.textbox.align = "center"
end
-- }}}

return conf.helpers.tablefunc(module, module.new)
-- vim: fdm=marker
