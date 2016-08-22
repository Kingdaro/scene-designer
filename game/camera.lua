local camera = {}

function camera:init()
  self.x = 0
  self.y = 0
  self.zoom = 1
end

function camera:drag(dx, dy)
  self.x = self.x + dx / self.zoom
  self.y = self.y + dy / self.zoom
end

function camera:scrollZoom(amount, delta)
  self.zoom = self.zoom * amount ^ delta
end

function camera:transform(draw)
  local sw, sh = love.graphics.getDimensions()
  love.graphics.push()
  love.graphics.translate(sw / 2, sh / 2)
  love.graphics.scale(self.zoom)
  love.graphics.translate(self.x, self.y)
  love.graphics.translate(-sw / 2, -sh / 2)
  draw()
  love.graphics.pop()
end

return camera
