require "engine"
require "objects.circle"

CircleRoom = Room:extend()

function love.load()
    Input:bind("f1", "f1")
    Input:bind("f2", "f2")
    Input:bind("f3", "shake")

    local circleRoom1 = addRoom("CircleRoom", "circleRoom1")
    local circleArea1 = Area(circleRoom1)
    circleArea1:addGameObject("Circle", gw/2, gh/2, {radius = 20})
    local circleRoom2 = addRoom("CircleRoom", "circleRoom2")
    local circleArea2 = Area(circleRoom2)
    circleArea2:addGameObject("Circle", gw/2, gh/2, {radius = 10})
end

function love.update(dt)
    if Input:pressed("f1") then
        gotoRoom("circleRoom1")
    end
    if Input:pressed("f2") then
        gotoRoom("circleRoom2")
    end
    if Input:pressed("shake") then
        print("shake")
        camera:shake(5, 60, 1)
    end
end