-- luacheck: no unused args
local editor = require 'editor'
local camera = require 'camera'
local menu = require 'menu'
local util = require 'util'

local cursorGrab = love.mouse.getSystemCursor('sizeall')

function love.load()
  love.graphics.setBackgroundColor(util.toLoveColor(0.2, 0.2, 0.2))
  love.window.maximize()
  editor:init(800, 600)
  camera:init()
  menu:init()
end

function love.update(dt)
end

function love.draw()
  camera:transform(function()
    editor:drawGrid()
    editor:drawObjects()
    editor:drawSelections()
  end)
  menu:draw()
end

function love.mousepressed(x, y, button, isTouch)
  if button == 1 then
    menu:close()
    local sx, sy = camera:getScenePosition(x, y)
    if not editor:selectFirstObjectAt(sx, sy) then
      editor:clearSelection()
    end
  elseif button == 2 then
    menu:open(x, y, {
      'Add Rectangle',
      'Add Ellipse',
      'Add Text',
      'Add Image'
    })
  end
end

function love.mousemoved(x, y, dx, dy)
  if love.mouse.isDown(3) then
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

function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end
end
