function love.load(arg)

    --Window Setup
    love.window.setMode(1080, 900)

    --love.window.setFullscreen(true)

    --Network Setup
    --clientInit()

    --Map Setup
    map = love.graphics.newImage("res/environment/grass_back.png")
    initCollisions(100)

    --Startup Values
    paused = false

    tree = Tree:create()
    mainHero = Orcus:create()
    heroes:pushBack(mainHero)

    --HUD creation
    local r,g,b,a = love.graphics.getColor()
    baseColor = {r, g, b, a}
end
