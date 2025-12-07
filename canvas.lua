local Canvas = {}
Canvas.scene = "main"
Canvas.jump_sound = love.audio.newSource("assets/sounds/jump.wav", "static")
Canvas.game_over_sound = love.audio.newSource("assets/sounds/game_over.wav", "static")

Canvas.game_font = love.graphics.newFont("assets/fonts/emulogic.ttf", 32)
Canvas.debug_font = love.graphics.newFont(20)

Canvas.is_stop = false
Canvas.debug = false
Canvas.tapped = false

Canvas.width,Canvas.height = love.graphics.getWidth(),love.graphics.getHeight()
Canvas.gravity = 600
Canvas.groundY = Canvas.height - 75


return Canvas