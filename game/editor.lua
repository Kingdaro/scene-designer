local util = require 'util'

local editor = {}

function editor:init(sceneWidth, sceneHeight)
  self.sceneWidth = sceneWidth
  self.sceneHeight = sceneHeight
  self.gridSpacing = 80
  self.objects = {
    {
      type = 'circle',
      x = 100,
      y = 100,
      color = { util.color(0.5, 0.5, 1) },
      radius = 50
    }
  }
end

function editor:drawGrid()
  love.graphics.setColor(util.color(0.1, 0.1, 0.1))
  love.graphics.setLineWidth(1)

  for x = 0, self.sceneWidth, self.gridSpacing do
    love.graphics.line(x, 0, x, self.sceneHeight)
  end
  for y = 0, self.sceneHeight, self.gridSpacing do
    love.graphics.line(0, y, self.sceneWidth, y)
  end

  love.graphics.setLineWidth(3)
  love.graphics.rectangle('line', 0, 0, self.sceneWidth, self.sceneHeight)
end

function editor:drawObjects()
  for _, o in ipairs(self.objects) do
    if o.type == 'circle' then
      love.graphics.push('all')
      love.graphics.setColor(o.color)
      love.graphics.circle('fill', o.x, o.y, o.radius)
      love.graphics.pop()
    end
  end
end

return editor
