Player = require("player")
Canvas = require("canvas")

local Cheat = {}
Cheat.cheat_code = {"up","up","down","down","left","right","left","right","b","a"}
Cheat.pressed_keys = {}
Cheat.stop_listening = false

function Cheat.keypressed(key)
    if Cheat.stop_listening then
        return
    end
    table.insert(Cheat.pressed_keys, key)

    if #Cheat.pressed_keys > #Cheat.cheat_code then
        table.remove(Cheat.pressed_keys,1)
    end

    if #Cheat.pressed_keys == #Cheat.cheat_code then
        Cheat.activated = true
        for i = 1, #Cheat.cheat_code do
            if Cheat.pressed_keys[i] ~= Cheat.cheat_code[i] then
                Cheat.activated = false
                break
            end
        end
    end

    if Cheat.activated then
        Player.can_die = false
        Cheat.stop_listening = true
        print("Cheat activated!")
        love.audio.play(Canvas.cheat_activated_sound)
    end

end

function Cheat.draw()
    if Cheat.activated then
        love.graphics.setColor(1, 0, 0)
        love.graphics.print("[CHEAT ACTIVATED]",Canvas.width / 5,Canvas.height / 4)
        love.graphics.setColor(1, 1, 1)
    end
end

return Cheat