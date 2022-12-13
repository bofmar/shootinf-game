local Entity = require('entity')
local Bullet = require('bullet')

local function Player()
  local player = Entity(300, 20, love.graphics.newImage('/sprites/panda.png'), 500)

  player.update = function(self, dt)
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
  end

  player.keyPressed = function(self, key)
    if key == 'space' then
      table.insert(listOfBullets, Bullet(self.x, self.y))
    end
  end

  return player
end

return Player
