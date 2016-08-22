local function color(r, g, b, a)
  return r * 255, g * 255, b * 255, (a or 1) * 255
end

return { color = color }
