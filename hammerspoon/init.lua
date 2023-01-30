require "pomodoor"

local hyper = {"ctrl", "alt" }

hs.loadSpoon("MiroWindowsManager")

hs.window.animationDuration = 0.0
spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "k"},
  right = {hyper, "l"},
  down = {hyper, "j"},
  left = {hyper, "h"},
  fullscreen = {hyper, "f"}
})