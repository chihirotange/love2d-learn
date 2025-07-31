-- require this BEFORE everything else
require "engine/utils"

Object = require "engine/classic"
Timer = require "engine/timer"
Input = require "engine/input"
require "engine/room"
require "engine.area"
require "engine.gameObject"
require "engine.Shake"
Camera = require "engine.camera"

function love.run()
    -- init global objects
    timer = Timer()
    Input = Input()
    love.window.setMode(sx*gw, sy*gh)
    if love.load then love.load(love.arg.parseGameArguments(arg), arg) end

	-- We don't want the first frame's dt to include time taken by love.load.
	if love.timer then love.timer.step() end

	local dt = 0

    -- setup canvas
    canvas = love.graphics.newCanvas(gw, gh)

    love.graphics.setCanvas(canvas)
    love.graphics.setCanvas()

    love.graphics.setDefaultFilter("nearest")
    love.graphics.setLineStyle("rough")

    -- setup camera
    camera = Camera()
	return function()
		-- Process events.
		if love.event then
			love.event.pump()
			for name, a,b,c,d,e,f in love.event.poll() do
				if name == "quit" then
					if not love.quit or not love.quit() then
						return a or 0
					end
				end
				love.handlers[name](a,b,c,d,e,f)
			end
		end

		-- Update dt, as we'll be passing it to update
		if love.timer then dt = love.timer.step() end

		-- Call update and draw
        timer:update(dt)
			
		-- update room
		if currentRoom then
			currentRoom:update(dt)
		end

        -- update camera
        camera:update(dt)

        -- love's update
		if love.update then love.update(dt) end -- will pass 0 if love.timer is disabled
        
        -- and love.draw
		if love.graphics and love.graphics.isActive() then
            if love.draw then love.draw() end
            if love.timer then love.timer.sleep(0.001) end
            end
        end
end
function love.draw()
    -- TODO: learn about these "canvas"
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    camera:attach(0, 0, gw*sx, gh*sy)
    love.graphics.circle("line", gw/2, gh/2, 20)
    if currentRoom then currentRoom:draw() end
    camera:detach()
    love.graphics.setCanvas()
    
    --draw the canvas itself
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.setBlendMode("alpha", "premultiplied")
    love.graphics.draw(canvas, 0, 0, 0, sx, sy)

    love.graphics.setBlendMode('alpha')
    love.graphics.present()
end