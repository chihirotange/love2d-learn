require "engine"
function love.load()
    Timer:after(1, function() print("hello world") end)
end

function love.update(dt)
end

function love.draw()
end