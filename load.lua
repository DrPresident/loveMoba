require "hero"

function love.load()

    --Window Setup
    --love.window.setFullscreen(true)

    --Map Setup
    grassback = love.graphics.newImage("res/grass_back.png")

    --Startup Values
    paused = false

    testHero = Hero.create()
    testHero.sprite:loadSprite("res/gunman_ss.jpg", 2, 5, .1, 7)
end
