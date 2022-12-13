local Entity = require('entity')

local function Bullet(x, y)
  local bullet = Entity(x, y, love.graphics.newImage('/sprites/bullet.png'), 700)

  bullet.dead = false

  bullet.isDead = function(self)
    return self.dead
  end

  bullet.update = function(self, dt)
    self.y = self.y + self.speed * dt

    -- if player misses, game restarts
    if self.y > love.graphics.getHeight() then
      love.load()
    end
  end

  bullet.checkCollision = function(self, obj)
    local bullet_left = self.x
    local bullet_right = self.x + self:getWidth()
    local bullet_top = self.y
    local bullet_bottom = self.y + self:getHeight()

    local obj_left = obj.x
    local obj_right = obj.x + obj:getWidth()
    local obj_top = obj.y
    local obj_bottom = obj.y + obj:getHeight()

    if bullet_right > obj_left
        and bullet_left < obj_right
        and bullet_bottom > obj_top
        and bullet_top < obj_bottom then
      self.dead = true

      obj.speed = obj.speed > 0 and obj.speed + 50 or obj.speed - 50
    end
  end

  return bullet
end

return Bullet
