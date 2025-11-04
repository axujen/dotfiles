-- Client menu using radical
local module = { 
    _autohide = true,
    _signal_list = {
        { "HUP",    "Hangup (POSIX)" },
        { "INT",    "Terminal interrupt (ANSI)" },
        { "QUIT",	"Terminal quit (POSIX)" },
        { "ILL",    "Illegal instruction (ANSI)" },
        { "TRAP",	"Trace trap (POSIX)" },
        { "IOT",    "IOT Trap (4.2 BSD)" },
        { "BUS",    "BUS error (4.2 BSD)" },
        { "FPE",    "Floating point exception (ANSI)" },
        { "KILL",	"Kill(can't be caught or ignored) (POSIX)" },
        { "USR1",	"User defined signal 1 (POSIX)" },
        { "SEGV",	"Invalid memory segment access (ANSI)" },
        { "USR2",	"User defined signal 2 (POSIX)" },
        { "PIPE",	"Write on a pipe with no reader, Broken pipe (POSIX)" },
        { "ALRM",	"Alarm clock (POSIX)" },
        { "TERM",	"Termination (ANSI)" },
        { "STKFLT",	"Stack fault" },
        { "CHLD",	"Child process has stopped or exited, changed (POSIX)" },
        { "CONT",	"Continue executing, if stopped (POSIX)" },
        { "STOP",	"Stop executing(can't be caught or ignored) (POSIX)" },
        { "TSTP",	"Terminal stop signal (POSIX)" },
        { "TTIN",	"Background process trying to read, from TTY (POSIX)" },
        { "TTOU",	"Background process trying to write, to TTY (POSIX)" },
        { "URG",    "Urgent condition on socket (4.2 BSD)" },
        { "XCPU",	"CPU limit exceeded (4.2 BSD)" },
        { "XFSZ",	"File size limit exceeded (4.2 BSD)" },
        { "VTALRM",	"Virtual alarm clock (4.2 BSD)" },
        { "PROF",	"Profiling alarm clock (4.2 BSD)" },
        { "WINCH",	"Window size change (4.3 BSD, Sun)" },
        { "IO",		"I/O now possible (4.2 BSD)" },
        { "PWR",	"Power failure restart (System V)" } }
    }

local my      = require('my')

local awful   = require('awful')
local radical = require('radical')

function module.worker(c, args)
    local c       = c             or client.focus
    local args    = args          or {}
    args.style    = args.style    or radical.style.classic
    if args.autohide == nil then args.autohide = module._autohide end

    -- Only generate a new menu when needed
    if not module._client or c.window ~= module._client.window or not module._menu then
        module._client = c
        module._generate(args)
    end

    return module._menu
end

-- Execute action and hide menu
function module._do(callable, autohide, checkvalue)
    return function(item)
        callable()
        if autohide then module._menu:hide() end
        if checkvalue then item.checked = checkvalue() end -- update checkbox
    end
end

function module._generate(args)
    local args    = args or {}
    if args.autohide == nil then args.autohide = module._autohide end

    local c      = module._client
    local action = module._do
    local menu   = radical.context{ style = args.style, filter = false }
    module._menu = menu


    -- Top segment
    menu:add_item{
        text = "Floating", checked = c.floating, checkable = true, button1 = action(
        function()
            c.floating = not c.floating
        end, args.autohide, function() return c.floating end)}
    menu:add_item{
        text = "Fullscreen", checked = c.fullscreen, checkable = true, button1 = action(
        function()
            c.fullscreen = not c.fullscreen
        end, args.autohide, function() return c.fullscreen() end )}
    menu:add_item{
        text = "Sticky", checked = c.sticky, checkable = true, button1 = action(
        function()
            c.sticky = not c.sticky
        end, args.autohide, function() return c.sticky end )}
    menu:add_item{
        text = "Maximized", checked = c.maximized, checkable = true, button1 = action(
        function()
            c.maximized = not c.maximized
        end, args.autohide, function() return c.maximized end)}
    menu:add_item{
        text = "On Top", checked = c.ontop, checkable = true, button1 = action(
        function()
            c.ontop = not c.ontop
        end, args.autohide, function() return c.ontop end )}

    -- Bottom segment
    menu:add_widget(radical.widgets.separator())
    menu:add_item{ text = "Move To Tag", sub_menu = module._tagMenu(args.autohide) }
    menu:add_item{ text = "Send Signal", sub_menu = module._sigMenu(args.autohide) }
    mClose = menu:add_item{ text = "Close", button1 = action(
        function()
            c:kill()
        end, args.autohide)}
end

function module._sigMenu(autohide)
    if autohide == nil then autohide = module._autohide end
    local sigMenu = radical.context{ style = module._menu.style, filter = module._menu.filter }

    for num,sig in pairs(module._signal_list) do
        sigMenu:add_item( { 
            text = "SIG" .. sig[1],
            button1 = module._do(function() module._send_sig(num) end, autohide),
            tooltip = sig[2] } )
    end

    return sigMenu
end

function module._send_sig(sig)
    awesome.kill(module._client.pid, sig)
end

function module._tagMenu(autohide)
    if autohide == nil then autohide = module._autohide end
    local tagMenu = radical.context{ style = module._menu.style, filter = module._menu.filter }

    for _,tag in pairs(module._client.screen.tags) do
        tagMenu:add_item({ 
            text = tag.index,
            button1 = module._do( function() module._client:move_to_tag(tag) end, autohide )
        })
    end

    return tagMenu
end

-- Destroy the menu once the client is closed
client.connect_signal("unmanage", function (c)
    if module._client.window == c.window then
        module._client = nil
        module._menu:hide()
        module._menu = nil
    end
end)

return my.func.tablefunc(module, module.worker)
