require("hs.application")
require("hs.window")

-----------------------------------------------
-- Global configurations
-----------------------------------------------
hs.window.animationDuration = 0
hs.hints.showTitleThresh = 0

-----------------------------------------------
-- Reload config on write
-----------------------------------------------
function reload_config(files)
    hs.reload()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("Config loaded")

-----------------------------------------------
-- Window management
-----------------------------------------------
hs.hotkey.bind({'ctrl', 'cmd'}, 'f', function () resize_win('native_fullscreen') end);
hs.hotkey.bind({'ctrl', 'cmd'}, 'c', function () resize_win('center')     end);

hs.hotkey.bind({'ctrl', 'cmd'}, 'u', function () resize_win('halfleft')   end);
hs.hotkey.bind({'ctrl', 'cmd'}, 'i', function () resize_win('halfright')  end);

hs.hotkey.bind({'ctrl', 'cmd'}, 'a', function () resize_win('thirdleft')   end);
hs.hotkey.bind({'ctrl', 'cmd'}, 's', function () resize_win('thirdmiddle')  end);
hs.hotkey.bind({'ctrl', 'cmd'}, 'd', function () resize_win('thirdright')  end);

hs.hotkey.bind({'ctrl', 'cmd'}, 'n', function () resize_win('twothirdleft')   end);
hs.hotkey.bind({'ctrl', 'cmd'}, 'm', function () resize_win('twothirdright')  end);

hs.hotkey.bind({        'cmd'}, 'escape', function() hs.hints.windowHints() end)

local browser = "Google Chrome"
local terminal = "iTerm"
local ide = "IntelliJ IDEA"

function get_application_path(app)
  return "/Applications/" .. app .. ".app"
end

-- Develop/Design workflow with terminal and browser
hs.hotkey.bind({"ctrl", "cmd"}, '1', function ()
  hs.application.launchOrFocus(get_application_path(browser))
  hs.application.launchOrFocus(get_application_path(terminal))
  hs.layout.apply({
    {hs.application.find(terminal), nil, nil, hs.layout.left50, nil, nil},
    {hs.application.find(browser), nil, nil, hs.layout.right50, nil, nil},
  })
end);

-- Test workflow with ide and terminal
hs.hotkey.bind({"ctrl", "cmd"}, '2', function ()
  hs.application.launchOrFocus(get_application_path(ide))
  hs.application.launchOrFocus(get_application_path(terminal))
  hs.layout.apply({
    {hs.application.find(ide), nil, nil, hs.layout.left50, nil, nil},
    {hs.application.find(terminal), nil, nil, hs.layout.right50, nil, nil},
  })
end);

-- Develop/Design workflow with ide and browser
hs.hotkey.bind({"ctrl", "cmd"}, '3', function ()
  hs.application.launchOrFocus(get_application_path(browser))
  hs.application.launchOrFocus(get_application_path(ide))
  hs.layout.apply({
    {hs.application.find(ide), nil, nil, hs.layout.left50, nil, nil},
    {hs.application.find(browser), nil, nil, hs.layout.right50, nil, nil},
  })
end);

function resize_win(direction)
    local win = hs.window.focusedWindow()
    if win then
        local f = win:frame()
        local screen = win:screen()
        local localf = screen:absoluteToLocal(f)
        local max = screen:fullFrame()
        local stepw = max.w/100
        local steph = max.h/100
        if direction == "right" then
            localf.w = localf.w+stepw
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "left" then
            localf.w = localf.w-stepw
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "up" then
            localf.h = localf.h-steph
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "down" then
            localf.h = localf.h+steph
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "halfright" then
            localf.x = max.w/2 localf.y = 0 localf.w = max.w/2 localf.h = max.h
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "halfleft" then
            localf.x = 0 localf.y = 0 localf.w = max.w/2 localf.h = max.h
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "halfup" then
            localf.x = 0 localf.y = 0 localf.w = max.w localf.h = max.h/2
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "halfdown" then
            localf.x = 0 localf.y = max.h/2 localf.w = max.w localf.h = max.h/2
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "thirdleft" then
            localf.x = 0 localf.y = 0 localf.w = max.w/3 localf.h = max.h
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "thirdmiddle" then
            localf.x = max.w/3 localf.y = 0 localf.w = max.w/3 localf.h = max.h
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "thirdright" then
            localf.x = max.w/3 * 2 localf.y = 0 localf.w = max.w/3 localf.h = max.h
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "twothirdright" then
            localf.x = max.w/3
            localf.y = 0
            localf.w = max.w/3 * 2
            localf.h = max.h
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "twothirdleft" then
            localf.x = 0
            localf.y = 0
            localf.w = max.w/3 * 2
            localf.h = max.h
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "cornerNE" then
            localf.x = max.w/2 localf.y = 0 localf.w = max.w/2 localf.h = max.h/2
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "cornerSE" then
            localf.x = max.w/2 localf.y = max.h/2 localf.w = max.w/2 localf.h = max.h/2
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "cornerNW" then
            localf.x = 0 localf.y = 0 localf.w = max.w/2 localf.h = max.h/2
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "cornerSW" then
            localf.x = 0 localf.y = max.h/2 localf.w = max.w/2 localf.h = max.h/2
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "center" then
            localf.x = (max.w-localf.w)/2 localf.y = (max.h-localf.h)/2
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "fcenter" then
            localf.x = stepw*5 localf.y = steph*5 localf.w = stepw*20 localf.h = steph*20
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "fullscreen" then
            localf.x = 0 localf.y = 0 localf.w = max.w localf.h = max.h
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "native_fullscreen" then
          win:toggleFullScreen()
        end
        if direction == "shrink" then
            localf.x = localf.x+stepw localf.y = localf.y+steph localf.w = localf.w-(stepw*2) localf.h = localf.h-(steph*2)
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "expand" then
            localf.x = localf.x-stepw localf.y = localf.y-steph localf.w = localf.w+(stepw*2) localf.h = localf.h+(steph*2)
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "mright" then
            localf.x = localf.x+stepw
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "mleft" then
            localf.x = localf.x-stepw
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "mup" then
            localf.y = localf.y-steph
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
        if direction == "mdown" then
            localf.y = localf.y+steph
            local absolutef = screen:localToAbsolute(localf)
            win:setFrame(absolutef)
        end
    else
        hs.alert.show("No focused window!")
    end
end
