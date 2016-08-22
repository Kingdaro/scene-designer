local function color(r, g, b, a)
  return r * 255, g * 255, b * 255, (a or 1) * 255
end

local function distance(ax, ay, bx, by)
  local dx = (bx - ax) ^ 2
  local dy = (by - ay) ^ 2
  return (dx + dy) ^ 0.5
end

return {
  color = color,
  distance = distance
}
