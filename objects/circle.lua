Circle = GameObject:extend()

function Circle:update(dt)
end

function Circle:draw()
    love.graphics.circle("line", self.x, self.y, self.radius)
end