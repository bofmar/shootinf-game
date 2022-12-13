local Entity = require('entity')

local function Bullet(x, y)
  local bullet = Entity(x, y, love.graphics.newImage('/sprites/bullet.png'), 700)

  bullet.update = function(self, dt)
    self.y = self.y + self.speed * dt
  end

  return bullet
end

return Bullet
