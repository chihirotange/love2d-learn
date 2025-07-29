Circle = Object:extend()

function Circle:new(x, y, radius)
    self.x, self.y, self.radius = x, y, radius
    Input:bind("mouse1", "test")
end

function Circle:update(dt)
    self:input()
end

function Circle:draw()
    love.graphics.circle("fill", self.x, self.y, self.radius)
end

function Circle:input()
    if Input:pressed("test") then print("mouse pressed") end
end