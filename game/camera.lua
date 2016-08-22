local camera = {}

function camera:init()
  self.x = -30
  self.y = -30
  self.zoom = 1
end

function camera:drag(dx, dy)
  self.x = self.x - dx / self.zoom
  self.y = self.y - dy / self.zoom
end

function camera:scrollZoom(amount, delta)
  self.zoom = self.zoom * amount ^ delta
end

function camera:getScenePosition(x, y)
  local sw, sh = love.graphics.getDimensions()
  return (x - sw / 2) / self.zoom + sw / 2 + self.x, (y - sh / 2) / self.zoom + sh / 2 + self.y
end

function camera:transform(draw)
  local sw, sh = love.graphics.getDimensions()
  love.graphics.push()
  love.graphics.translate(sw / 2, sh / 2)
  love.graphics.scale(self.zoom)
  love.graphics.translate(-sw / 2, -sh / 2)
  love.graphics.translate(-self.x, -self.y)
  draw()
  love.graphics.pop()
end

return camera
