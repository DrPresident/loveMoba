function love.load(arg)

    --Window Setup
    love.window.setMode(1080, 900)

    --love.window.setFullscreen(true)

    --Network Setup
    serverInit()

    --Map Setup
    --map = love.graphics.newImage("res/environment/grass_back.png")
    --initCollisions(100)

    --Startup Values
    paused = false
    recv = false
    conn = false

    heroes = Vector:create()
    creeps = Vector:create()
    collidables = Vector:create()

    --tree = Tree:create()
    --mainHero = Nija:create()
    --heroes:pushBack(mainHero)

    --HUD creation
    local r,g,b,a = love.graphics.getColor()
    baseColor = {r, g, b, a}
end
