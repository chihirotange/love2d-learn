rooms = {}
currentRoom = nil

Room = Object:extend()
function Room:new()
    self.areas = {}
end

function Room:active()
end

function Room:deactivate()
end

function Room:update(dt)
    for _, area in ipairs(self.areas) do
        area:update(dt)
    end
end

function Room:draw()
    for _, area in ipairs(self.areas) do
        area:draw()
    end
end

function Room:addArea(area)
    if area then 
        table.insert(self.areas, area) 
    end
end

function addRoom(roomType, roomName, ...)
    local room = _G[roomType](roomName, ...)
    rooms[roomName] = room
    return room
end

function gotoRoom(roomName)
    if rooms[roomName] then
        if currentRoom then
            currentRoom:deactivate()
        end
        currentRoom = rooms[roomName]
        currentRoom:active()
    end
end