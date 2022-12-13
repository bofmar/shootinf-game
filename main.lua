local Player = require('player')
local Enemy = require('enemy')
local Bullet = require('bullet')

function love.load()
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
  end
end

function love.draw()
  player:draw()
  enemy:draw()

  for i, v in ipairs(listOfBullets) do
    v:draw()
  end
end
