require "engine"

MainMenu = Room:extend()

function MainMenu:update(dt)
end
function love.load()
    Input:bind("mouse1", "test")
end

function love.update(dt)
end

function love.draw()
end