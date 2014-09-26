local _PACKAGE = (...):match("^(.+)[%./][^%./]+") or ""
local class = require(_PACKAGE.."/class")

local light = class(function(l, world, x, y, r, g, b, range)
  l.world = world
	l.direction = 0
	l.angle = math.pi * 2.0
	l.range = 0
	l.shadow = love.graphics.newCanvas()
	l.shine = love.graphics.newCanvas()
	l.x = x or 0
	l.y = y or 0
	l.z = 15
	l.red = r or 255
	l.green = g or 255
	l.blue = b or 255
	l.range = range or 300
	l.smooth = 1.0
	l.glowSize = 0.1
	l.glowStrength = 0.0
	l.changed = true
	l.visible = true
end)

-- set position
function light:setPosition(x, y, z)
  if x ~= self.x or y ~= self.y or (z and z ~= self.z) then
    self.x = x
    self.y = y
    if z then
      self.z = z
    end
    self.changed = true
  end
end

-- get x
function light:getX()
  return self.x
end

-- get y
function light:getY()
  return self.y
end

-- set x
function light:setX(x)
  if x ~= self.x then
    self.x = x
    self.changed = true
  end
end

-- set y
function light:setY(y)
  if y ~= self.y then
    self.y = y
    self.changed = true
  end
end
-- set color
function light:setColor(red, green, blue)
  self.red = red
  self.green = green
  self.blue = blue
end

-- set range
function light:setRange(range)
  if range ~= self.range then
    self.range = range
    self.changed = true
  end
end

-- set direction
function light:setDirection(direction)
  if direction ~= self.direction then
    if direction > math.pi * 2 then
      self.direction = math.mod(direction, math.pi * 2)
    elseif direction < 0.0 then
      self.direction = math.pi * 2 - math.mod(math.abs(direction), math.pi * 2)
    else
      self.direction = direction
    end
    self.changed = true
  end
end
-- set angle
function light:setAngle(angle)
  if angle ~= self.angle then
    if angle > math.pi then
      self.angle = math.mod(angle, math.pi)
    elseif angle < 0.0 then
      self.angle = math.pi - math.mod(math.abs(angle), math.pi)
    else
      self.angle = angle
    end
    self.changed = true
  end
end
-- set glow size
function light:setSmooth(smooth)
  self.smooth = smooth
  self.changed = true
end
-- set glow size
function light:setGlowSize(size)
  self.glowSize = size
  self.changed = true
end
-- set glow strength
function light:setGlowStrength(strength)
  self.glowStrength = strength
  self.changed = true
end
-- get type
function light:getType()
  return "light"
end

return light