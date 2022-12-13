local Entity = require('entity')

local function Enemy()
  local enemy = Entity(325, 450, love.graphics.newImage('/sprites/snake.png'), 100)

  enemy.update = function(self, dt)
    self.x = self.x + self.speed * dt

    local window_width = love.graphics.getWidth()

    -- Enemy should change directions once it hits a wall
    if self.x < 0 then
      self.x = 0
      self:changeDirection()
    elseif self.x > window_width - self:getWidth() then
      self.x = window_width - self:getWidth()
      self:changeDirection()
    end
  end

  enemy.changeDirection = function(self)
    self.speed = self.speed * -1
  end

  return enemy
end

return Enemy
