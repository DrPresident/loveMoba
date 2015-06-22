require "hero"
require "orcus"

function love.load(arg)

    --Window Setup
    love.window.setMode(1080, 900)
    --love.window.setFullscreen(true)

    --Map Setup
    map = love.graphics.newImage("res/grass_back.png")

    --Startup Values
    paused = false

    mainHero = Orcus:create()
    --mainHero.sprite:loadSprite("res/orcus.png", 4, 3,.2, 3)
end
