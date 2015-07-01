require "hero"
require "orcus"
require "nija"
require "tree"

function love.load(arg)

    --Window Setup
    love.window.setMode(1080, 900)
    --love.window.setFullscreen(true)

    --Map Setup
    map = love.graphics.newImage("res/environment/grass_back.png")

    --Startup Values
    paused = false

    tree = Tree:create()
    mainHero = Orcus:create()
    heroes:pushBack(mainHero)

    --HUD creation
    local r,g,b,a = love.graphics.getColor()
    baseColor = {r, g, b, a}
end
