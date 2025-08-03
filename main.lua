require "engine"
require "objects.circle"
require "objects.player"

CircleRoom = Room:extend()

function love.load()
    mainRoom = addRoom("CircleRoom", "circleRoom1")
    circle1 = mainRoom:spawn("Circle", 100, 100, {radius = 10})
    gotoRoom("circleRoom1")
end

function love.update(dt)
end