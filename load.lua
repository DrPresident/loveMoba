require "hero"

function love.load()

    --Window Setup
    --love.window.setFullscreen(true)

    --Map Setup
    grassback = love.graphics.newImage("res/grass_back.png")
    
    --Startup Values
    paused = false
    
    testHero = Hero.create()
    --testHero.sprite = love.graphics.newImage("res/test.png")
    testHero.sprite.loadSprite("res/gunman_ss.jpg")   
    
end