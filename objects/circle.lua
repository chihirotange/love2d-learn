Circle = GameObject:extend()

function Circle:update(dt)
end

function Circle:draw()
    love.graphics.circle("fill", self.x, self.y, self.radius)
end