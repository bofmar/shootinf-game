local function Player()
  return {
    image = love.graphics.newImage('/sprites/panda.png'),
    x = 300,
    y = 20,
    speed = 500,

    update = function(self, dt)
      if love.keyboard.isDown('a') or love.keyboard.isDown('left') then
        self.x = self.x - self.speed * dt
      elseif love.keyboard.isDown('d') or love.keyboard.isDown('right') then
        self.x = self.x + self.speed * dt
      end

      local window_width = love.graphics.getWidth()

      -- Prevent player from going out of the window
      if self.x < 0 then
        self.x = 0
      elseif self.x > window_width - self:getWidth() then
        self.x = window_width - self:getWidth()
      end
    end,

    draw = function(self)
      love.graphics.draw(self.image, self.x, self.y)
    end,

    getWidth = function(self)
      return self.image:getWidth()
    end
  }
end

return Player
