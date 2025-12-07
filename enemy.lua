Canvas = require("canvas")
Player = require("player")
Utils = require("utils")
local Enemy = {}

function spawn()
	local enemy = {}

	enemy.x = love.math.random(Canvas.width+1000,Canvas.width)
	enemy.y = love.math.random(Canvas.groundY,Canvas.groundY - Player.size)
	enemy.size = 10
	enemy.speed = love.math.random(Player.score + 400,600 + Player.score * 2)
    enemy.img = love.graphics.newImage("assets/images/trident.png")
    enemy.width = enemy.img:getWidth()
    enemy.height = enemy.img:getHeight()
	return enemy
end

function Enemy.load()
    Enemy.enemies = {}
end

function Enemy.update(dt)
    if  #Enemy.enemies == 0 then
        table.insert(Enemy.enemies,spawn())
    end

    for i = #Enemy.enemies, 1, -1 do
        local enemy = Enemy.enemies[i]       -- get the table
        enemy.x = enemy.x - enemy.speed * dt -- move left
        if Utils.checkCollision(Player,enemy) and Player.can_die then
            Player.is_alive = false
            if Canvas.scene ~= "main" then
                love.audio.play(Canvas.game_over_sound)
            end
        end
        if enemy.x < 0 then
            Player.score = Player.score + 10
            table.remove(Enemy.enemies, i)
        end
    end

end

function Enemy.draw()
    for i = #Enemy.enemies, 1, -1 do
        enemy = Enemy.enemies[i]
        love.graphics.draw(enemy.img,enemy.x,enemy.y)
    end
end

return Enemy