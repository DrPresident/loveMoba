require "hero"

function love.load()

    --Window Setup
    love.window.setMode(1080, 900,{})
    --love.window.setFullscreen(true)

    --Map Setup
    grassback = love.graphics.newImage("res/grass_back.png")

    --Startup Values
    paused = false

    mainHero = Hero.create()
    mainHero.sprite:loadSprite("res/gunman_ss.jpg", 2, 5, .1, 7)

end
