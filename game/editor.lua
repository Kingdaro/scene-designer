local editor = {}

function editor:init(sceneWidth, sceneHeight)
  self.sceneWidth = sceneWidth
  self.sceneHeight = sceneHeight
  self.gridSpacing = 80
end

function editor:drawGrid()
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

return editor
