require "hero"
require "orcus"
require "tree"

function love.load(arg)

    --Window Setup
    love.window.setMode(1080, 900)
    --love.window.setFullscreen(true)

    --Map Setup
    map = love.graphics.newImage("res/grass_back.png")

    --Startup Values
    paused = false

    tree = Tree:create()
    mainHero = Orcus:create()
end
