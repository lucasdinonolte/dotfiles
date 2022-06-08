require "pomodoor"

local hyper = {"ctrl", "alt" }
local hyperShift = {"ctrl", "alt", "shift" }

hs.loadSpoon("MiroWindowsManager")

hs.window.animationDuration = 0.1
spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "k"},
  right = {hyper, "l"},
  down = {hyper, "j"},
  left = {hyper, "h"},
  fullscreen = {hyper, "f"}
})

-- Pomodoro Timer
hs.hotkey.bind(hyper, "9", function() pom_enable() end)
hs.hotkey.bind(hyper, "0", function() pom_disable() end)
hs.hotkey.bind(hyperShift, "9", function() pom_reset_work() end)

function hideDock(hide)
  local asCommand = "tell application \"System Events\" to return autohide of dock preferences"
  local ok, theDockIsHidden = hs.osascript.applescript(asCommand)

  if ok then
    if hide and not theDockIsHidden then
      hs.eventtap.keyStroke({'cmd', 'alt'}, 'd')
    end

    if theDockIsHidden and not hide then
      hs.eventtap.keyStroke({'cmd', 'alt'}, 'd')
    end
  end
end

-- Layouts
local working_layout = {
  {"Slack", nil, nil, {x=0, y=0, w=0.5, h=0.5}, nil, nil},
  {"Mail", nil, nil, {x=0, y=0.5, w=0.5, h=0.5}, nil, nil},
  {"Google Chrome", nil, nil, hs.layout.right50, nil, nil},
}

hs.hotkey.bind(hyper, '1', function()
  hideDock(false)
  hs.application.launchOrFocus('Slack')
  hs.application.launchOrFocus('Mail')
  hs.application.launchOrFocus('Google Chrome')

  hs.layout.apply(working_layout)
end)

local designing_layout = {
  {"Figma", nil, nil, hs.layout.maximized, nil, nil}
}

hs.hotkey.bind(hyper, '2', function() 
  hideDock(true)
  hs.application.launchOrFocus('Figma')

  hs.layout.apply(designing_layout)
end)

local coding_layout = {
  {"Hyper", nil, nil, hs.layout.left50, nil, nil},
  {"Google Chrome", nil, nil, hs.layout.right50, nil, nil},
}

hs.hotkey.bind(hyper, '3', function()
  hideDock(true)
  hs.application.launchOrFocus('Hyper')
  hs.application.launchOrFocus('Google Chrome')

  hs.layout.apply(coding_layout)
end)

-- Shortcuts to important folders and files
local function openDirectoryOnKey(key, dir)
  local mod = { 'ctrl', 'alt', 'shift' }
  hs.hotkey.bind(mod, key, function()
    local shell_command = "open " .. dir
    hs.execute(shell_command)
  end)
end

openDirectoryOnKey('d', '"/Users/lucasdinonolte/DSI Dropbox/Projects"')
openDirectoryOnKey('p', '/Users/lucasdinonolte/Nextcloud/Projekte/Kunden')
openDirectoryOnKey('b', '/Users/lucasdinonolte/Nextcloud/Buchhaltung/')
