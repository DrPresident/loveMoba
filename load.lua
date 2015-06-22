require "hero"

function love.load(arg)

    --Window Setup
    love.window.setMode(1080, 900)
    --love.window.setFullscreen(true)

    --Map Setup
    map = love.graphics.newImage("res/grass_back.png")

    --Startup Values
    paused = false

    setMainHero(Hero.create())
    mainHero.sprite:loadSprite("res/Nija.png", 4, 3, .1, 3)

end
