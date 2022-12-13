local Entity = require('entity')

local function Enemy()
  local enemy = Entity(325, 450, love.graphics.newImage('/sprites/snake.png'), 100)

  enemy.update = function(self, dt)
    self.x = self.x + self.speed * dt

    local window_width = love.graphics.getWidth()

    -- Enemy should change directions once it hits a wall
    if self.x < 0 then
      self.x = 0
      self.speed = 100
    elseif self.x > window_width - self:getWidth() then
      self.x = window_width - self:getWidth()
      self.speed = -100
    end
  end

  return enemy
end

return Enemy
