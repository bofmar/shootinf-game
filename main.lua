local Player = require('player')

function love.load()
  player = Player()
end

function love.update(dt)
  player:update(dt)
end

function love.draw()
  player:draw()
end
