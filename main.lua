require "engine"
require "objects.circle"
require "objects.player"

CircleRoom = Room:extend()

function love.load()
    -- Input:bind("f1", "f1")
    -- Input:bind("f2", "f2")
    Input:bind("f3", "playerDeath")

    local circleRoom1 = addRoom("CircleRoom", "circleRoom1")
    local circleArea1 = Area(circleRoom1)
    cirlce = circleArea1:addGameObject("Circle", 20, 20, {radius = 10})
    circle2 = circleArea1:addGameObject("Circle", 40, 50, {radius = 30})
    player = circleArea1:addGameObject("Player", gw/2, gh/2)
    gotoRoom("circleRoom1")
    -- local circleRoom2 = addRoom("CircleRoom", "circleRoom2")
    -- local circleArea2 = Area(circleRoom2)
    -- circleArea2:addGameObject("Circle", gw/2, gh/2, {radius = 10})
end

function love.update(dt)
    if Input:pressed("playerDeath") then
        camera:shake(1, 40, 0.5)
    end
    -- if Input:pressed("f2") then
    --     gotoRoom("circleRoom2")
    -- end
    -- if Input:pressed("shake") then
    --     print("shake")
    --     camera:shake(5, 60, 0.5)
    -- end
end