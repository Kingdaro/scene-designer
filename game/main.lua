-- luacheck: no unused args
local editor = require 'editor'
local camera = require 'camera'
local util = require 'util'

local cursorGrab = love.mouse.getSystemCursor('sizeall')

function love.load()
  love.graphics.setBackgroundColor(util.color(0.2, 0.2, 0.2))
  editor:init(love.graphics.getDimensions())
  camera:init()
end

function love.update(dt)
end

function love.mousemoved(x, y, dx, dy)
  if love.mouse.isDown(1) then
    camera:drag(dx, dy)
    love.mouse.setCursor(cursorGrab)
  end
end

function love.mousereleased(x, y, button, isTouch)
  love.mouse.setCursor()
end

function love.wheelmoved(x, y)
  camera:scrollZoom(1.1, y)
end

function love.draw()
  camera:transform(function()
    editor:drawGrid(80)
  end)
end

function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end
end
