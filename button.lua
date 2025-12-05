local Player = require("player")
local Enemy = require("enemy")

local Button = {}

function Button.load()
    local img = love.graphics.newImage("assets/images/start_button.png")

    Button.img = img
    Button.x = 256
    Button.y = 256
    Button.w = img:getWidth()
    Button.h = img:getHeight()
end

function Button.draw()
    love.graphics.draw(Button.img, Button.x, Button.y)
end

function Button.mousepressed(mx,my,button)
    if button == 1 then
        if (mx > Button.x and mx < Button.x + Button.w and
           my > Button.y and my < Button.y + Button.h and Canvas.scene == "main") or not Player.is_alive then
            Canvas.scene = "play"
            Enemy.enemies = {}
            Player.score = 0
            Player.is_alive = true
            Canvas.is_stop = false
        end
    end
end

return Button