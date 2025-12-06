local Player = require("player")
local Enemy = require("enemy")

local Button = {}

function Button.draw()
    love.graphics.setFont(Canvas.game_font)
    love.graphics.print("[Tap To Start]",Canvas.width / 4,Canvas.height / 2)
end

function Button.mousepressed(mx,my,button)
    if button == 1 then
        if (Canvas.scene == "main") or not Player.is_alive then
            Canvas.scene = "play"
            Enemy.enemies = {}
            Player.score = 0
            Player.is_alive = true
            Canvas.is_stop = false
        end
    end
end

return Button