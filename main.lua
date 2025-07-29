-- TODO: create and engine module or something, to handle load these things
Object = require "libraries.classic"
Input = require "libraries.input"
Timer = require"libraries.timer"
require "objects.circle"

-- TODO: create library to instantiate objects, keeps track of them, handle update, draw...

function love.load()
    Input = Input()
    Timer = Timer()
    circle1 = Circle(150, 150, 50)
    Timer:tween(2, circle1, {radius = 100}, "elastic")
end

function love.update(dt)
    Timer:update(dt)
end

function love.draw()
    circle1:draw()
end

function love.keypressed(key)
    if (key == "escape") then
        love.event.quit()
    end
end