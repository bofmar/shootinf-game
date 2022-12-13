local function Entity(x, y, image, speed)
  return {
    x = x,
    y = y,
    image = image,
    speed = speed,

    getWidth = function(self)
      return self.image:getWidth()
    end,

    draw = function(self)
      love.graphics.draw(self.image, self.x, self.y)
    end
  }
end

return Entity
