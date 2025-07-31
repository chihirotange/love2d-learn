GameObject = Object:extend()

function GameObject:new(area, x, y, opt)
    if area then
        local opt = opt or {}
        if opt then for k, v in pairs(opt) do self[k] = v end end
        self.area = area
        self.x = x
        self.y = y
        self.id = UUID()
        self.dead = false
        self.timer = Timer()
    else
        print("please provide valid area object when creating object")
    end
end

function GameObject:update(dt)
    self.timer:update(dt)
end

function GameObject:draw()
end