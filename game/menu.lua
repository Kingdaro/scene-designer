local util = require 'util'

local menu = {}

function menu:init()
  self.font = love.graphics.newFont('Roboto-Medium.ttf', 18)
  self.visible = false
  self.x = 0
  self.y = 0
  self.options = {}
end

function menu:open(x, y, options)
  self.visible = true
  self.x, self.y = x, y
  self.options = options
end

function menu:close()
  self.visible = false
end

function menu:draw()
  if not self.visible then return end

  love.graphics.push()
  love.graphics.translate(self.x, self.y)

  local itemSpacing = 16
  local fontHeight = self.font:getHeight()
  local menuHeight = fontHeight * #self.options + itemSpacing * (#self.options + 1)

  love.graphics.setColor(util.toLoveColor(0.5, 0.5, 0.5))
  love.graphics.setLineWidth(4)
  love.graphics.rectangle('line', 0, 0, 145, menuHeight)

  love.graphics.setColor(util.toLoveColor(1, 1, 1))
  love.graphics.rectangle('fill', 0, 0, 145, menuHeight)

  love.graphics.setColor(util.toLoveColor(0.2, 0.2, 0.2))
  love.graphics.setFont(self.font)
  for i, text in ipairs(self.options) do
    love.graphics.print(text, 10, itemSpacing + (fontHeight + itemSpacing) * (i - 1))
  end

  love.graphics.pop()
end

return menu
