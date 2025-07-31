rooms = {}
currentRoom = nil

local Room = Object:extend()
function Room:new()
    print("room created")
end

function Room:active()
end

function Room:deactivate()
end

function Room:update()
end

function Room:draw()
end

function addRoom(roomType, roomName, ...)
    local room = _G[roomType](roomName, ...)
    rooms[roomName] = room
    return room
end

function gotoRoom(roomType, roomName, ...)
    if currentRoom and rooms[roomName] then
        currentRoom:deactivate()
        currentRoom = rooms[roomName]
        currentRoom:active()
    else
        currentRoom = addRoom(roomType, roomName, ...)
    end
end

return Room