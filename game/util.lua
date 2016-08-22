-- returns a color converted from 0-1 to 0-255, used by love <= 0.10
local function toLoveColor(r, g, b, a)
  if type(r) == 'table' then
    r, g, b, a = unpack(r)
  end
  return r * 255, g * 255, b * 255, (a or 1) * 255
end

-- returns a new color with the specified transparency amount
local function opacity(color, value)
  local r, g, b, a = unpack(color)
  return r, g, b, (a or 1) * value
end

-- returns the distance between points (ax, ay) and (bx, by)
local function distance(ax, ay, bx, by)
  local dx = (bx - ax) ^ 2
  local dy = (by - ay) ^ 2
  return (dx + dy) ^ 0.5
end

return {
  toLoveColor = toLoveColor,
  opacity = opacity,
  distance = distance
}
