Player = GameObject:extend()

function Player:draw()
    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.circle("line", self.x, self.y, 10)
end