local Player = require("player")
local Enemy = require("enemy")
local Canvas = require("canvas")
local Button = require("button")

print("Visit my github: https://github.com/isa0-gh/lua-dino-game\nGood games!")
function love.load()
	Player.load()
	Enemy.load()
	Button.load()

	love.graphics.setFont(Canvas.game_font)
	background = love.graphics.newImage("assets/images/background.png")
	love.graphics.setBackgroundColor(0.0039, 0.0353, 0.1608)
end


function love.mousepressed(x, y, button, istouch)
	Button.mousepressed(x,y,button,istouch)
	Canvas.tapped = true
end

function love.keypressed(key)
	if key == "f3" then
        Canvas.debug = not Canvas.debug
    end

	if key == "q" then
		love.event.quit()
	end

	if key == "escape" and Player.is_alive then
		Canvas.is_stop = not Canvas.is_stop
	end

	if key == "space" and not Player.is_alive then
		Canvas.scene = "play"
		Enemy.enemies = {}
		Player.score = 0
		Player.is_alive = true
		Canvas.is_stop = false
	end
end


function love.update(dt)
	if not Canvas.is_stop then
		Player.update(dt)
		Enemy.update(dt)
	end
end

function love.draw()
	love.graphics.draw(background, 0, 150)
	if Canvas.scene == "main" then
		love.graphics.setFont(Canvas.game_font)
		love.graphics.print("Dino Game v1.0.0\nCreated By Isa")
		Button.draw()
		return
	end
	if Canvas.debug then
		love.graphics.setFont(Canvas.debug_font)
		local text = string.format("Current Player Y Veloicty : %d\nCurrent Player Y: %d\nCurrent Ground Y:%d\nAlive:%s",
                                    Player.vy,Player.y,Canvas.groundY,Player.is_alive)
		love.graphics.print(text)
    end

	if Canvas.is_stop and Player.is_alive then
		love.graphics.setFont(Canvas.game_font)
		love.graphics.print("Game Stopped!",Canvas.width / 4,Canvas.height / 2)
	end

	if not Player.is_alive then
		Canvas.is_stop = true
		love.graphics.setFont(Canvas.game_font)
		love.graphics.print("Game Over!\n[Tap To Restart]",Canvas.width / 4,Canvas.height / 2)
	end

	love.graphics.setFont(Canvas.game_font)
	love.graphics.print(Player.score,Canvas.width / 2.5,Canvas.height / 3)
	Player.draw()
	Enemy.draw()
end

