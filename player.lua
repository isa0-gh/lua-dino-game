Canvas = require("canvas")

local Player = {}

function Player.load()
    Player.x = Canvas.width / 7
    Player.y = Canvas.groundY
    Player.score = 0
    Player.size = 10
    Player.speed = 20
    Player.jump = 4 * 100
    Player.vy = 0
    Player.is_alive = false

    Player.img = love.graphics.newImage("assets/images/dino.png")
    Player.width = Player.img:getWidth() - 25
    Player.height = Player.img:getHeight() - 25
end

function Player.update(dt)

    if (love.keyboard.isDown("space") or Canvas.tapped) and Player.y >= Canvas.groundY  then
		Canvas.tapped = false
        love.audio.play(Canvas.jump_sound)
        Player.vy = -Player.jump
    end


    Player.vy = Player.vy + Canvas.gravity * dt
    Player.y = Player.y + Player.vy * dt

    if Player.y > Canvas.groundY then
        Player.y = Canvas.groundY
        Player.vy = 0
    end
end

function Player.draw()
    love.graphics.draw(Player.img,Player.x,Player.y)
	
end

return Player