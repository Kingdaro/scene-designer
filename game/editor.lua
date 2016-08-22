local util = require 'util'

local editor = {}

local selectionColor = { 0.2, 0.5, 1 }

function editor:init(sceneWidth, sceneHeight)
  self.sceneWidth = sceneWidth
  self.sceneHeight = sceneHeight
  self.gridSpacing = 80
  self.objects = {
    {
      type = 'circle',
      x = 100,
      y = 100,
      color = { 0.5, 0.5, 1},
      radius = 50
    }
  }

  self.selection = {}
end

function editor:selectFirstObjectAt(x, y)
  for _, o in ipairs(self.objects) do
    if util.distance(x, y, o.x, o.y) < o.radius then
      self.selection = { o }
      return o
    end
  end
end

function editor:clearSelection()
  self.selection = {}
end

function editor:drawGrid()
  love.graphics.setColor(util.toLoveColor(0.1, 0.1, 0.1))
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
      love.graphics.setColor(util.toLoveColor(o.color))
      love.graphics.circle('fill', o.x, o.y, o.radius)
      love.graphics.pop()
    end
  end
end

function editor:drawSelections()
  for _, o in ipairs(self.selection) do
    local x, y, width, height
    if o.type == 'circle' then
      x = o.x - o.radius
      y = o.y - o.radius
      width = o.radius * 2
      height = width
    end

    love.graphics.push('all')

    -- selection fill
    love.graphics.setColor(util.toLoveColor(util.opacity(selectionColor, 0.3)))
    love.graphics.rectangle('fill', x, y, width, height)

    -- selection outline
    love.graphics.setColor(util.toLoveColor(selectionColor))
    love.graphics.setLineWidth(2)
    love.graphics.rectangle('line', x, y, width, height)

    love.graphics.pop()
  end
end

return editor
