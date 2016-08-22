local util = require 'util'

local menu = {}

local optionSpacing = 16

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

  local menuWidth = self.font:getWidth(self.options[1])
  for i=2, #self.options do
    local opt = self.options[i]
    local width = self.font:getWidth(opt)
    if width > menuWidth then
      menuWidth = width
    end
  end

  menuWidth = menuWidth + optionSpacing

  local fontHeight = self.font:getHeight()
  local optionHeight = fontHeight + optionSpacing
  local menuHeight = optionHeight * #self.options

  love.graphics.setColor(util.toLoveColor(0.5, 0.5, 0.5))
  love.graphics.setLineWidth(4)
  love.graphics.rectangle('line', 0, 0, menuWidth, menuHeight)

  love.graphics.setColor(util.toLoveColor(1, 1, 1))
  love.graphics.rectangle('fill', 0, 0, menuWidth, menuHeight)

  love.graphics.setFont(self.font)

  for i, text in ipairs(self.options) do
    local y = (fontHeight + optionSpacing) * (i - 1)
    love.graphics.setColor(util.toLoveColor(0.2, 0.2, 0.2))
    love.graphics.print(text, optionSpacing / 2, y + optionSpacing / 2)
  end

  love.graphics.pop()
end

return menu
