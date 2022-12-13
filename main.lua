local Player = require('player')
local Enemy = require('enemy')

function love.load()
  player = Player()
  enemy = Enemy()
end

function love.update(dt)
  player:update(dt)
  enemy:update(dt)
end

function love.draw()
  player:draw()
  enemy:draw()
end
