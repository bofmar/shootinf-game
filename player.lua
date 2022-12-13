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
    end,

    draw = function(self)
      love.graphics.draw(self.image, self.x, self.y)
    end,
  }
end

return Player
