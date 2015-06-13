require "hero"

function love.load()
    testHero = Hero.create("res/test.png", normal)
    testHero.scale = .1
end