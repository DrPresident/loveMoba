require "hero"

function love.load()

    --Window Setup
    love.window.setFullscreen(true)

    --Map Setup
    grassback = love.graphics.newImage("res/grass_back.png")
    
    --Startup Values
    paused = false
    
    testHero = Hero.create()
    testHero.image = love.graphics.newImage("res/test.png")
    testHero.scale = .1
    
    
end