Area = Object:extend()

function Area:new(room)
    if room then
        room:addArea(self)
        self.room = room
        self.gameObjects = {}
    else
        print("please provide valid room when add new area")
    end
end

function Area:update(dt)
    for i = #self.gameObjects, 1, -1 do
        local gameObject = self.gameObjects[i]
        gameObject:update(dt)
        -- remove by index lol
        if gameObject.dead then table.remove(self.gameObjects, i) end
    end
end

function Area:draw()
    for _, gameObject in ipairs(self.gameObjects) do gameObject:draw() end
end

function Area:addGameObject(type, x, y, opt)
    local opt = opt or {}
    local gameObject = _G[type](self, x, y, opt)
    table.insert(self.gameObjects, gameObject)
    return gameObject
end