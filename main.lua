local Player = require('player')
local Enemy = require('enemy')
local Bullet = require('bullet')

function love.load()
  score = 0
  player = Player()
  enemy = Enemy()
  listOfBullets = {}
end

function love.keypressed(key)
  player:keyPressed(key)
end

function love.update(dt)
  player:update(dt)
  enemy:update(dt)

  for i, v in ipairs(listOfBullets) do
    v:update(dt)
    v:checkCollision(enemy)

    if v:isDead() then
      table.remove(listOfBullets, i)
      score = score + 1
    end
  end
end

function love.draw()
  player:draw()
  enemy:draw()
  love.graphics.print('Score: ' .. score, 0, 0, 0, 2, 2)

  for i, v in ipairs(listOfBullets) do
    v:draw()
  end
end
