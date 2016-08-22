local camera = require 'camera'

local function color(r, g, b, a)
  return r * 255, g * 255, b * 255, (a or 1) * 255
end

local sceneWidth = 1280
local sceneHeight = 720
local gridSpacing = 80

local cursorGrab = love.mouse.getSystemCursor('sizeall')

function love.load()
  love.graphics.setBackgroundColor(color(0.2, 0.2, 0.2))
  camera:init()
end

function love.update(dt)
end

function love.mousemoved(_, _, dx, dy)
  if love.mouse.isDown(1) then
    camera:drag(dx, dy)
    love.mouse.setCursor(cursorGrab)
  end
end

function love.mousereleased(x, y, button, isTouch)
  love.mouse.setCursor()
end

function love.wheelmoved(_, y)
  camera:scrollZoom(1.1, y)
end

function love.draw()
  camera:transform(function()
    love.graphics.setColor(color(0.1, 0.1, 0.1))
    love.graphics.setLineWidth(1)

    for x = 0, sceneWidth, gridSpacing do
      love.graphics.line(x, 0, x, sceneHeight)
    end
    for y = 0, sceneHeight, gridSpacing do
      love.graphics.line(0, y, sceneWidth, y)
    end

    love.graphics.setLineWidth(3)
    love.graphics.rectangle('line', 0, 0, sceneWidth, sceneHeight)
  end)
end

function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end
end
